local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.isdirectory(install_path)==0 then
  print("running")
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]


return require('packer').startup(
  function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- color scheme
  use {'kaicataldo/material.vim', branch='main' , 
  	config = [[
  	    vim.g.material_theme_style = 'palenight'
		vim.g.material_terminal_italics = 1
		vim.cmd "colorscheme material"
		vim.cmd "au ColorScheme * hi Normal ctermbg=None guibg=None"
   	]] }

  -- language plugins
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  -- editing helper plugins
  use { 'tpope/vim-repeat', keys = '.'}
  -- file manager

  -- miscellaneous
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'plugins/statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use { 'akinsho/nvim-bufferline.lua', config = function() require 'plugins/tabline' end, requires = 'kyazdani42/nvim-web-devicons'}
  use { 
  	'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require 'plugins/gitsigns' end
  }
  use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}



  end,
  {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
