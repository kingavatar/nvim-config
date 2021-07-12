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

  use { 'glepnir/dashboard-nvim',
      cmd = {
        "Dashboard",
        "DashboardNewFile",
        "DashboardJumpMarks",
        "SessionLoad",
        "SessionSave"
      },
      config = function() require('plugins.dashboard').config() end
  }

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

  use { 'kabouzeid/nvim-lspinstall'}

  use { 'neovim/nvim-lspconfig',
    event = "BufReadPre",
    config = function() require('plugins.lsp') end,
    wants = { "nvim-lsp-ts-utils", "null-ls.nvim", "lua-dev.nvim" },
	requires = {
	  { 'glepnir/lspsaga.nvim', config = function() require("plugins.lspsaga") end },
	  { 'ray-x/lsp_signature.nvim', config = function() require("plugins.lspsign") end },
	  { 'nvim-lua/lsp-status.nvim', config = function () require('plugins.lspstatus') end },
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/null-ls.nvim",
      "folke/lua-dev.nvim",
	}
  }


  use { 'hrsh7th/nvim-compe',
    event = "InsertEnter",
     config = function() require('plugins.comple').config() end,
     wants = {"LuaSnip"},
     requires={
     	{'windwp/nvim-autopairs',
     	  after = "nvim-compe",
     	  config = function()
            require("nvim-autopairs").setup()
     	    require("nvim-autopairs.completion.compe").setup(
                    {
                        map_cr = true,
                        map_complete = true -- insert () func completion
                    }
            )
     	  end
     	},
     	{
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          event = "InsertCharPre",
          config = function()
              require("plugins.comple").snippets()
          end
        },
        "rafamadriz/friendly-snippets"
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

  use {'kyazdani42/nvim-tree.lua', config= function() require('plugins.nvimtree').config() end,
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
	  requires = {}
  }
  -- use {
  --   'yamatsum/nvim-nonicons',
  --   requires = {'kyazdani42/nvim-web-devicons'}
  -- }

  use {'famiu/bufdelete.nvim'}

  use { 'simrat39/symbols-outline.nvim', config = function () require('plugins.symbols_outline').config() end,
  	  cmd = {"SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose"}
  }
  -- Fuzzy Finder, Picker etc

  use {'nvim-telescope/telescope.nvim', config= function() require("plugins/telescope") end,
	requires = {{'nvim-telescope/telescope-media-files.nvim'},{'nvim-lua/popup.nvim'}}
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  --[[ use {
	'ojroques/nvim-lspfuzzy',
	 requires = {
		{'junegunn/fzf',
		  run = function() vim.fn["fzf#install"]() end,
		  cmd = "FZF",
		  fn = {"fzf#run", "fzf#wrap"}
		},
		{'junegunn/fzf.vim',
		  config = function() require('plugins.fzf').config() end,
		  cmd = { "Files", "GFiles", "Buffers", "Colors",
		     "Ag", "Rg", "Lines", "BLines", "Tags",
             "BTags", "Marks", "Windows", "Locate", "History",
             "Snippets", "Commits", "Commands",
             "Maps", "Helptags", "Filetypes"
		  }
		},  -- to enable preview (optional)
	 },
	 config = function() require('lspfuzzy').setup {} end
  } ]]


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
  	event = "BufReadPre",
    config = function() require('plugins.gitsigns').config() end
  }
  use { 'TimUntersberger/neogit',
	config = function() require 'neogit'.setup {} end,
	requires = 'nvim-lua/plenary.nvim' 
  }


  -- Miscellaneous

  use { 'kdav5758/TrueZen.nvim', config = function() require 'plugins/truezen' end }

  use { 'folke/which-key.nvim',
    module = "which-key",
    event = "VimEnter",
    config = function()
        require("plugins.whichkey")
        require("mappings").whichkeySetup()
    end
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
