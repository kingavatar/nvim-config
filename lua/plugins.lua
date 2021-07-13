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

  use {
    -- 'kaicataldo/material.vim',
    -- "sainnhe/edge",
    -- "sainnhe/sonokai",
    'folke/tokyonight.nvim',
    config = function() require("plugins.theme") end
  }

  -- language plugins

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
     event = "BufRead",
     config = function() require('plugins.nvimtreesitter').config() end,
     requires = {
       {'p00f/nvim-ts-rainbow',event = "BufRead"}
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

  use { 'sbdchd/neoformat', cmd = "Neoformat" }

  use { 'RRethy/vim-illuminate', requires = {'neovim/nvim-lspconfig'},
      -- config = function () require('plugins.illuminate') end
      event = "CursorHold",
      module = "illuminate",
      config = function()
          vim.g.Illuminate_delay = 1000
      end,
  }


  use { 'peterhoeg/vim-qml', ft = "qml"}

  -- Comment

  use { 'b3nj5m1n/kommentary',
      opt = true,
      wants = "nvim-ts-context-commentstring",
      keys = { "gc", "gcc", "<C-_>" },
      config = function() require('plugins.comments').config() end,
      requires = {"JoosepAlviste/nvim-ts-context-commentstring", opt=true}
  }

  -- Snippet Support
  -- use "hrsh7th/vim-vsnip"
  -- use "rafamadriz/friendly-snippets"


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

  use {'nvim-telescope/telescope.nvim', config= function() require("plugins.telescope").config() end,
    cmd = "Telescope",
	requires = {
	    {'nvim-telescope/telescope-media-files.nvim'},
	    {'nvim-lua/popup.nvim'},
	    {"nvim-lua/plenary.nvim"},
        {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	  }
  }


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
    'glepnir/galaxyline.nvim',
    event = "VimEnter",
    config = function() require'plugins/statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {'kyazdani42/nvim-web-devicons',
      module = "nvim-web-devicons",
      config = function() require('file-icons').config() end
  }

  use { 'akinsho/nvim-bufferline.lua',
    event = "BufReadPre",
    config = function() require 'plugins.tabline' end,
	requires = 'kyazdani42/nvim-web-devicons'
  }

  use { 'lukas-reineke/indent-blankline.nvim',
    event = "BufReadPre",
	config = function() require('plugins.blankline').config() end
  }

  -- Git Plugins

  use {
  	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
  	event = "BufReadPre",
    config = function() require('plugins.gitsigns').config() end
  }
  use { 'TimUntersberger/neogit',
    cmd = "Neogit",
	config = function() require 'neogit'.setup {} end,
	requires = 'nvim-lua/plenary.nvim'
  }
  use({
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    config = function()
      require("plugins.diffview")
    end,
  })



  -- Miscellaneous

  use { 'Pocco81/TrueZen.nvim',
      cmd = {"TZAtaraxis", "TZMinimalist"},
      config = function() require('plugins.truezen').config() end
  }

  use({
    "folke/todo-comments.nvim",
    cmd = { "TodoTrouble", "TodoTelescope" },
    event = "BufReadPost",
    config = function()
      require("plugins.todo")
    end,
  })

  use { 'folke/which-key.nvim',
    module = "which-key",
    event = "VimEnter",
    config = function()
        require("plugins.whichkey")
        require("mappings").whichkeySetup()
    end
  }

  use { 'karb94/neoscroll.nvim',
	keys = { "<C-u>", "<C-d>", "gg", "G" },
    config = function() require('plugins.neoscroll') end
  }
  use({
    "edluffy/specs.nvim",
    after = "neoscroll.nvim",
    config = function()
      require("plugins.specs")
    end,
  })
  use { "dstein64/nvim-scrollview",
      event = "WinScrolled",
      config = function() require("plugins.scrollbar") end
  }

  use({ "nvim-lua/plenary.nvim", module = "plenary" })
  use({ "nvim-lua/popup.nvim", module = "popup" })

   -- load autosave only if its globally enabled
    use {
        "Pocco81/AutoSave.nvim",
        config = function()
            require("plugins.autosave").config()
        end,
        cond = function()
            return vim.g.auto_save == true
        end
    }

  use { 'norcalli/nvim-colorizer.lua',
    event = "BufReadPre",
    config = function ()
      require'colorizer'.setup({'*';},{
        RGB      = true;         -- #RGB hex codes
        RRGGBB   = true;         -- #RRGGBB hex codes
        names    = true;         -- "Name" codes like Blue
        RRGGBBAA = true;        -- #RRGGBBAA hex codes
        rgb_fn   = true;        -- CSS rgb() and rgba() functions
        hsl_fn   = true;        -- CSS hsl() and hsla() functions
        css      = true;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn   = true;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
        -- Available modes: foreground, background
        mode     = 'background'; -- Set the display mode.
      })
      vim.cmd("ColorizerReloadAllBuffers")
      vim.cmd([[autocmd ColorScheme * lua package.loaded['colorizer'] = nil; require('colorizer').setup(); require('colorizer').attach_to_buffer(0)]])
    end
  }

  use {
	'sudormrfbin/cheatsheet.nvim',
	cmd = { "Cheatsheet", "CheatsheetEdit" },
	requires = {
	  {'nvim-telescope/telescope.nvim'},
	  {'nvim-lua/popup.nvim'},
	  {'nvim-lua/plenary.nvim'},
	}
  }

  use {"tweekmonster/startuptime.vim", cmd = "StartupTime"}

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
