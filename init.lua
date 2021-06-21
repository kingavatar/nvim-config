vim.cmd('augroup KingCmd')
vim.cmd('autocmd!')
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
vim.cmd('augroup END')

vim.cmd('filetype plugin indent on')
vim.cmd('syntax on')

require("general")
require("mappings")
require("plugins")
