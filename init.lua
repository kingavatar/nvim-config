vim.cmd('augroup KingCmd')
vim.cmd('autocmd!')
vim.cmd('augroup END')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require("mappings")
require("general")
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua
require("plugins")
require("highlights")
