local cmd = vim.cmd
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
end

cmd [[packadd packer.nvim]]


return require('packer').startup(
  function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- color scheme
  use {'kaicataldo/material.vim', branch='main' , 
  	config = [[vim.g.material_theme_style = 'palenight'
		vim.g.material_terminal_italics = 1
		cmd "colorscheme material"
		cmd "au ColorScheme * hi Normal ctermbg=None guibg=None"
   	]] }

  -- language plugins
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }


  use {
    'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('gitsigns').setup() end
  }

  -- editing helper plugins
  use { 'tpope/vim-repeat', 'cmd' : '.'}
  -- file manager

  -- miscellaneous
  use {
    'glepnir/galaxyline.nvim', branch = 'main', config = function() require'statusline' end,
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  end,
  {
    display = {
        border = {"┌", "─", "┐", "│", "┘", "─", "└", "│"}
    }
  }
)
