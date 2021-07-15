local cmd = vim.cmd
cmd('augroup KingCmd')
cmd('autocmd!')
cmd('augroup END')

cmd('filetype plugin indent on')
cmd('syntax on')

if vim.fn.has('vim_starting') then
  vim.g.mapleader = ","
  vim.g.maplocalleader = " "
  vim.g.auto_save = false
  -- cmd [[au VimEnter * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setProfile KingKonsoleVim]]
  -- cmd [[au VimLeave * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setProfile KingKonsole]]
end


cmd 'autocmd BufWritePost plugins/init.lua PackerCompile' -- Auto compile when there are changes in plugins/init.lua

require("mappings")
require("general")
vim.defer_fn(function () require("plugins") end, 0)
vim.defer_fn(function () require("misc") end, 0)
-- require("highlights")  -- Tokyonight ColorScheme Provides all necessarry highlights

