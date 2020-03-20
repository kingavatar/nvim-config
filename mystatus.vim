set laststatus=2

function! ChangeColorScheme(colorscheme,mode) " {{{
	if a:colorscheme == 'nord'
		hi mystatuslinesep ctermfg=8 guifg=#4C566A guibg=#2E3440
		hi StatusLine ctermfg=6 ctermbg=8 guifg=#88C0D0 guibg=#4C566A
	elseif a:colorscheme == 'palenight'
		hi TabLine ctermfg=145 ctermbg=59 guifg=#bfc7d5 guibg=#697098
		if a:mode == 'n'
			hi mystatuslinesep ctermfg=59 guifg=#697098 
			hi mystatusbody cterm=None ctermfg=170 ctermbg=59 guifg=#c792ea guibg=#697098
		elseif a:mode == 'i'
			hi mystatuslinesep ctermfg=39 guifg=#5164C0
			hi mystatusbody cterm=None ctermfg=39 ctermbg=59 guifg=#82b1ff guibg=#5164C0
		elseif a:mode == 'R'
			hi mystatuslinesep ctermfg=173 guifg=#F78C6C 
			hi mystatusbody cterm=None ctermfg=180 ctermbg=173 guifg=#ffcb6b guibg=#F78C6C
		elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
			hi mystatuslinesep ctermfg=204 guifg=#ff5370 
			hi mystatusbody cterm=None ctermfg=255 ctermbg=204 guifg=#eeeeee guibg=#ff5370
		endif
	endif
	return ''
endfunction
"}}}

function! GetReadOnly()
	if &readonly
		return ''
	else
		return ''
	endif
	return ''
endfunction
let current_scheme = get(g:, 'colors_name', 'default')
set statusline=%{ChangeColorScheme(current_scheme,mode())}

" Left Side StatusItems
set statusline+=%#mystatuslinesep#
set statusline+=%#mystatusbody#\ 
set statusline+=%#mystatusbody#\ %.20f
set statusline+=%#mystatusbody#\%{GetReadOnly()}
set statusline+=%#mystatusbody#%m 
set statusline+=%#mystatuslinesep#\ 
set statusline+=%{coc#status()}%{get(b:,'coc_current_function','')}
" Right Side mystatusbody

set statusline+=%=
set statusline+=%#mystatuslinesep#
"set statusline+=%#mystatusbody#%{WebDevIconsGetFileTypeSymbol()}\ 
set statusline+=%#mystatusbody#%{mpi#get(expand('%:t'))}\ 
set statusline+=%#mystatusbody#%{SetFiletype(&filetype)}
set statusline+=%#mystatuslinesep#\ 
set statusline+=%#mystatuslinesep#
"set statusline+=%#mystatusbody#%{WebDevIconsGetFileFormatSymbol()}\ 
set statusline+=%#mystatusbody#%{GetfileformatSymbol()}\ \  
set statusline+=%#mystatusbody#%{&fileencoding?&fileencoding:&encoding}
set statusline+=%#mystatuslinesep#\ 
set statusline+=%#mystatuslinesep#
set statusline+=%#mystatusbody#\ 
set statusline+=%#mystatusbody#%2l
set statusline+=\/%#mystatusbody#%2c
set statusline+=%#mystatuslinesep#\ 
set statusline+=%#mystatuslinesep#
set statusline+=%#mystatusbody#☰\ \ 
set statusline+=%#mystatusbody#%P
set statusline+=\/\%#mystatusbody#%L
set statusline+=%#mystatuslinesep#

