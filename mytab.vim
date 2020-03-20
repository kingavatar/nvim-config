set showtabline=2

function! MyTabline(mode)
	hi mytabline cterm=None ctermfg=145 ctermbg=59 guifg=#bfc7d5 guibg=#697098 
	if a:mode == 'n'
		hi mytablinefill ctermfg=59 guifg=#697098
		hi mytablinesel cterm=None ctermfg=170 ctermbg=59 guifg=#c792ea guibg=#697098
	elseif a:mode == 'i'
		hi mytablinefill ctermfg=39 guifg=#5164C0
		hi mytablinesel cterm=None ctermfg=39 ctermbg=59 guifg=#82b1ff guibg=#5164C0
	elseif a:mode == 'R'
		hi mytablinefill ctermfg=173 guifg=#F78C6C 
		hi mytablinesel cterm=None ctermfg=180 ctermbg=173 guifg=#ffcb6b guibg=#F78C6C
	elseif a:mode == 'v' || a:mode == 'V' || a:mode == '^V'
		hi mytablinefill ctermfg=204 guifg=#ff5370 
		hi mytablinesel cterm=None ctermfg=255 ctermbg=204 guifg=#eeeeee guibg=#ff5370
	endif
	let s = ' '
	let buflist = filter(range(1,bufnr('$')),'buflisted(v:val) && "quickfix" !=? getbufvar(v:val, "&buftype")')
	for bufnum in buflist
        let bufname = bufname(bufnum)
        let bufmodified = getbufvar(bufnum, "&mod")
		let s .= '%'.(1 + tabpagenr('$')).'X'
		let s .= '%#mytablinefill#'
		let s .= (bufnum == bufnr() ? '%#mytablinesel#' : '%#mytabline#')
		let s .= '' . bufnum . ' '
		let s .= (bufname != '' ? fnamemodify(bufname, ':t') : '[No Name]')
        let s .= ' ' . mpi#get(expand(bufname)) . ' ' 
		if bufmodified
            let s .= '[+]'
        endif
        let s .= '%#mytablinefill# '
	endfor
	return s
endfunction

set tabline=%!MyTabline(mode())
