vim.g.Illuminate_delay = 100
vim.g.Illuminate_highlightUnderCursor = 1

vim.api.nvim_command [[ hi def link LspReferenceText PmenuSbar  ]]
vim.api.nvim_command [[ hi def link LspReferenceWrite illuminatedCurWord ]]
vim.api.nvim_command [[ hi def link LspReferenceRead illuminate  ]]

vim.g.Illuminate_ftblacklist ={'NvimTree','dashboard'}

vim.cmd[[
augroup illuminate_augroup
    autocmd!
    autocmd VimEnter * hi illuminate ctermfg=231 ctermbg=209 guifg=#ffffff guibg=#f78c6c
    autocmd VimEnter * hi link illuminatedWord illuminate 
    autocmd VimEnter * hi illuminatedCurWord cterm=italic gui=italic ctermfg=231 ctermbg=209 guifg=#ffffff guibg=#f78c6c
augroup END
]]


vim.api.nvim_set_keymap('n', '<a-n>', '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', {noremap=true})
vim.api.nvim_set_keymap('n', '<a-p>', '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', {noremap=true})
