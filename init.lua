local cmd = vim.cmd
cmd('augroup KingCmd')
cmd('autocmd!')
cmd('augroup END')

cmd('filetype plugin indent on')
cmd('syntax on')

if vim.fn.has('vim_starting') then
  vim.g.mapleader = ","
  vim.g.maplocalleader = [[<Space>]]

  -- Release keymappings prefixes, evict entirely for use of plug-ins.
  -- cmd [[nnoremap <Space>  <Nop>]]
  -- cmd [[xnoremap <Space>  <Nop>]]
  -- cmd [[nnoremap ,        <Nop>]]
  -- cmd [[xnoremap ,        <Nop>]]

  cmd [[au VimEnter * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setProfile KingKonsoleVim]]
  cmd [[au VimLeave * :silent !qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION setProfile KingKonsole]]
end


require("mappings")
require("general")
cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
require("plugins")
require("highlights")

-- hide line numbers , statusline in specific buffers!
vim.api.nvim_exec(
    [[
   au BufEnter term://* setlocal nonumber
   au BufEnter term://* set laststatus=0 
]],
    false
)

