""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking

map <leader>ss :setlocal spell!<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""
" => quicker window switching
""""""""""""""""""""""""""""""""""""""""""
map <C-Down> <C-W>j
map <C-Up> <C-W>k
map <C-Left> <C-W>h
map <C-Right> <C-W>l
map <C-Enter> <C-w>=
map <A-Left> <C-w><
map <A-Right> <C-w>>
map <A-Up> <C-w>+
map <A-Down> <C-w>-

nnoremap <localleader><localleader> :xa!<CR>
nnoremap <localleader>q :q<CR>
nnoremap <localleader>w :w<CR>
" Tab navigation like Firefox.
nnoremap <S-tab>   :bn<CR>
"nnoremap <C-t>     :tabnew<CR>
inoremap <S-tab>   <Esc>:bn<CR>i
"inoremap <C-t>     <Esc>:tabnew<CR>
""""""""""""""""""""""""""""""""""""""""""

