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

  -- color scheme

  use {'kaicataldo/material.vim', branch='main' , 
  	config = [[
  	    vim.g.material_theme_style = 'palenight'
  		vim.g.material_terminal_italics = 1
  		vim.cmd "colorscheme material"
  		vim.cmd "au ColorScheme * hi Normal ctermbg=None guibg=None"
   	]] }

  -- language plugins

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', 
     config = function() require 'plugins/nvimtreesitter' end 
  }
  use { 'neovim/nvim-lspconfig', config = function() require 'plugins/lspconfig' end }
  use { 'hrsh7th/nvim-compe', 
     config = function() require 'plugins/comple' end,
     requires={
     	{'windwp/nvim-autopairs', config = function() require("nvim-autopairs").setup() end}
     }
  }
  use { 'onsails/lspkind-nvim', config = function() require('lspkind').init() end }
  use { 'kabouzeid/nvim-lspinstall', requires = {'neovim/nvim-lspconfig'}  }

  -- Comment

  use { 'terrortylor/nvim-comment', config = function() 
  	require('nvim_comment').setup() 

	-- Comment --
	
	vim.api.nvim_set_keymap("i", "<C-_>", [[ <Cmd> CommentToggle<CR>]], 
	  {noremap=true,silent=false}
	)
	vim.api.nvim_set_keymap("n", "<C-_>", [[ <Cmd> CommentToggle<CR>]], 
	  {noremap=true,silent=false}
	)
	vim.api.nvim_set_keymap("v", "<C-_>", [[  :'<,'>CommentToggle<CR>]], 
	  {noremap=true,silent=false}
	)
	end 
  }

  -- Snippet Support
  use "hrsh7th/vim-vsnip"
  use "rafamadriz/friendly-snippets"


  -- Editing Helper Plugins

  use { 'tpope/vim-repeat', keys = '.'}
 
  
  -- File Manager, Naviagtion

  use {'kyazdani42/nvim-tree.lua', config= function() require 'plugins/nvimtree' end, 
	requires = {{'kyazdani42/nvim-web-devicons', config = function() require 'file-icons' end}}
  }

  use {'famiu/bufdelete.nvim'}

  -- Fuzzy Finder, Picker etc
  use {'nvim-telescope/telescope.nvim', config= function() require("plugins/telescope") end,
	requires = {{'nvim-telescope/telescope-media-files.nvim'},{'nvim-lua/popup.nvim'}}
  }

  -- Display Plugins
  use { 'glepnir/dashboard-nvim', config = function() require 'plugins/dashboard' end }
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'plugins/statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use { 'akinsho/nvim-bufferline.lua', config = function() require 'plugins/tabline' end,
	requires = 'kyazdani42/nvim-web-devicons'
  }
  use { 
  	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require 'plugins/gitsigns' end
  }
  use { 'lukas-reineke/indent-blankline.nvim', branch = "lua",
	config = function() require 'plugins/blankline' end
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
