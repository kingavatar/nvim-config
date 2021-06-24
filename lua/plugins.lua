local cmd = vim.cmd
local fn = vim.fn

local install_path = vim.fn.expand(vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim')

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]


return require('packer').startup(
  function()

  -- Packer can manage itself

  use {'wbthomason/packer.nvim'}

  -- Startup Plugin

  use { 'glepnir/dashboard-nvim', config = function() require 'plugins/dashboard' end }

  -- color scheme

  use {'kaicataldo/material.vim', branch='main' ,
  	config = function ()
  	    vim.g.material_theme_style = 'palenight'
  		vim.g.material_terminal_italics = 1
  		vim.cmd "colorscheme material"
  	 	-- vim.cmd "au ColorScheme * hi Normal ctermbg=None guibg=None"
   	end
  }


  -- language plugins

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
     config = function() require 'plugins/nvimtreesitter' end,
     requires = {
       {'p00f/nvim-ts-rainbow'}
     }
  }

  use { 'neovim/nvim-lspconfig', config = function() require 'plugins/lspconfig' end,
	requires = {
	  { 'glepnir/lspsaga.nvim', config = function() require("plugins/lspsaga") end },
	  { 'ray-x/lsp_signature.nvim', config = function() require("plugins/lspsign") end },
	  { 'kabouzeid/nvim-lspinstall' }
	}
  }

  use { 'onsails/lspkind-nvim', config = function() require('lspkind').init() end }

  use { 'hrsh7th/nvim-compe',
     config = function() require 'plugins/comple' end,
     requires={
     	{'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup() end},
     }
  }
  use { 'sbdchd/neoformat' }

  use { 'RRethy/vim-illuminate', requires = {'neovim/nvim-lspconfig'},
	  config = function () require('plugins/illuminate') end
  }

  -- Comment

  use { 'terrortylor/nvim-comment', config = function() require('nvim_comment').setup() end }

  -- Snippet Support
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"


  -- Editing Helper Plugins

  use { 'tpope/vim-repeat', keys = '.'}
 
  
  -- File Manager, Naviagtion

  -- File Manager, Naviagtion

  use {'kyazdani42/nvim-tree.lua', config= function() require 'plugins/nvimtree' end,
	requires = {{'kyazdani42/nvim-web-devicons', config = function() require 'file-icons' end}}
  }

  use {'famiu/bufdelete.nvim'}

  -- Fuzzy Finder, Picker etc

  use {'nvim-telescope/telescope.nvim', config= function() require("plugins/telescope") end,
	requires = {{'nvim-telescope/telescope-media-files.nvim'},{'nvim-lua/popup.nvim'}}
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use {
	'ojroques/nvim-lspfuzzy',
	 requires = {
		{'junegunn/fzf', run =function() vim.fn["fzf#install"]() end },
		{'junegunn/fzf.vim', config = "require('plugins/fzf')"},  -- to enable preview (optional)
	 },
	 config = function() require('lspfuzzy').setup {} end
  }


  -- Display Plugins

  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'plugins/statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use { 'akinsho/nvim-bufferline.lua', config = function() require 'plugins/tabline' end,
	requires = 'kyazdani42/nvim-web-devicons'
  }

  use { 'lukas-reineke/indent-blankline.nvim', branch = "lua",
	config = function() require 'plugins/blankline' end
  }

  -- Git Plugins

  use {
  	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require 'plugins/gitsigns' end
  }
  use { 'TimUntersberger/neogit',
	config = function() require 'neogit'.setup {} end,
	requires = 'nvim-lua/plenary.nvim' 
  }


  -- Miscellaneous

  use { 'kdav5758/TrueZen.nvim', config = function() require 'plugins/truezen' end }

  use { 'folke/which-key.nvim',
   config = function() require("plugins/whichkey") end
  }

  use {
	'sudormrfbin/cheatsheet.nvim',
	requires = {
	  {'nvim-telescope/telescope.nvim'},
	  {'nvim-lua/popup.nvim'},
	  {'nvim-lua/plenary.nvim'},
	}
  }
  -- use { 'karb94/neoscroll.nvim',
  --  config = function() require('neoscroll').setup() end
  -- }

  end,
  {
    display = {
        open_fn = function()
		  return require('packer.util').float({ border = 'single' })
		end,
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
