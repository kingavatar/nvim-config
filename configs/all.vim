if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>d
		\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif

if dein#tap('vim-clap')

endif

if dein#tap('rainbow_parentheses.vim')
	let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
	let g:rbpt_colorpairs = [
		\ ['brown',       'RoyalBlue3'],
		\ ['Darkblue',    'SeaGreen3'],
		\ ['darkgray',    'DarkOrchid3'],
		\ ['darkgreen',   'firebrick3'],
		\ ['darkcyan',    'RoyalBlue3'],
		\ ['darkred',     'SeaGreen3'],
		\ ['darkmagenta', 'DarkOrchid3'],
		\ ['brown',       'firebrick3'],
		\ ['gray',        'RoyalBlue3'],
		\ ['black',       'SeaGreen3'],
		\ ['darkmagenta', 'DarkOrchid3'],
		\ ['Darkblue',    'firebrick3'],
		\ ['darkgreen',   'RoyalBlue3'],
		\ ['darkcyan',    'SeaGreen3'],
		\ ['darkred',     'DarkOrchid3'],
		\ ['red',         'firebrick3'],
		\ ]

	let g:rbpt_max = 16
	let g:rbpt_loadcmd_toggle = 0

	au VimEnter * RainbowParenthesesToggle
	au Syntax * RainbowParenthesesLoadRound
	au Syntax * RainbowParenthesesLoadSquare
	au Syntax * RainbowParenthesesLoadBraces


endif
if dein#tap('coc.nvim')
	let g:coc_node_path = '/home/saikiran/.nvm/versions/node/*/bin/node'
	inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

	function! s:check_back_space() abort
  		let col = col('.') - 1
 		return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	let g:coc_snippet_next = '<tab>'

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
	" position. Coc only does snippet and additional edit on confirm.
	if has('patch8.1.1068')
		" Use `complete_info` if your (Neo)Vim version supports it.
		inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
	else
		imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
	endif
	inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
				\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
	" Use <C-l> for trigger snippet expand.
	imap <C-l> <Plug>(coc-snippets-expand)

	" Use <C-j> for select text for visual placeholder of snippet.
	vmap <C-j> <Plug>(coc-snippets-select)

	" Use <C-j> for jump to next placeholder, it's default of coc.nvim
	let g:coc_snippet_next = '<c-j>'

	" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
	let g:coc_snippet_prev = '<c-k>'

	" Use <C-j> for both expand and jump (make expand higher priority.)
	imap <C-j> <Plug>(coc-snippets-expand-jump)

	" Use `[g` and `]g` to navigate diagnostics
	nmap <silent> [g <Plug>(coc-diagnostic-prev)
	nmap <silent> ]g <Plug>(coc-diagnostic-next)

	" GoTo code navigation.
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window.
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
	endfunction

	" Highlight the symbol and its references when holding the cursor.
	autocmd CursorHold * silent call CocActionAsync('highlight')

	" Symbol renaming.
	nmap <leader>rn <Plug>(coc-rename)

	" Formatting selected code.
	xmap <leader>f  <Plug>(coc-format-selected)
	nmap <leader>f  <Plug>(coc-format-selected)
	command! -nargs=0 Prettier :CocCommand prettier.formatFile

	" Remap keys for applying codeAction to the current line.
	nmap <leader>ac  <Plug>(coc-codeaction)
	" Apply AutoFix to problem on the current line.
	nmap <leader>qf  <Plug>(coc-fix-current)
	" Add `:Format` command to format current buffer.
	command! -nargs=0 Format :call CocAction('format')

	" Add `:Fold` command to fold current buffer.
	command! -nargs=? Fold :call     CocAction('fold', <f-args>)

	" Add `:OR` command for organize imports of the current buffer.
	command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

endif

if dein#tap('fzf.vim')
	let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
	let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
	" let g:fzf_layout = { 'window': 'call FloatingFZF()' }
	
	" function! FloatingFZF()
	" 	let buf = nvim_create_buf(v:false, v:true)
	" 	call setbufvar(buf, '&signcolumn', 'no')
		
	" 	let height = float2nr(10)
	" 	let width = float2nr(80)
	" 	let horizontal = float2nr((&columns - width) / 2)
	" 	let vertical = 1
		
	" 	let opts = {
	" 			\ 'relative': 'editor',
	" 			\ 'row': vertical,
	" 			\ 'col': horizontal,
	" 			\ 'width': width,
	" 			\ 'height': height,
	" 			\ 'style': 'minimal'
	" 			\ }
		
	" 	call nvim_open_win(buf, v:true, opts)
	" endfunction
	
	" Files + devicons + floating fzf
	
	nnoremap <silent> <leader>e :call FzfFilePreview()<CR>
	
	function! FzfFilePreview()
		let l:fzf_files_options = '--preview "bat --theme="OneHalfDark" --style=numbers,changes --color always {3..-1} | head -200" --expect=ctrl-v,ctrl-x'
		let s:files_status = {}

		function! s:cacheGitStatus()
			let l:gitcmd = 'git -c color.status=false -C ' . $PWD . ' status -s'
			let l:statusesStr = system(l:gitcmd)
			let l:statusesSplit = split(l:statusesStr, '\n')
			for l:statusLine in l:statusesSplit
			let l:fileStatus = split(l:statusLine, ' ')[0]
			let l:fileName = split(l:statusLine, ' ')[1]
			let s:files_status[l:fileName] = l:fileStatus
			endfor
		endfunction

		function! s:files()
			call s:cacheGitStatus()
			let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
			return s:prepend_indicators(l:files)
		endfunction

		function! s:prepend_indicators(candidates)
			return s:prepend_git_status(s:prepend_icon(a:candidates))
		endfunction

		function! s:prepend_git_status(candidates)
			let l:result = []
			for l:candidate in a:candidates
			let l:status = ''
			let l:icon = split(l:candidate, ' ')[0]
			let l:filePathWithIcon = split(l:candidate, ' ')[1]

			let l:pos = strridx(l:filePathWithIcon, ' ')
			let l:file_path = l:filePathWithIcon[pos+1:-1]
			if has_key(s:files_status, l:file_path)
				let l:status = s:files_status[l:file_path]
				call add(l:result, printf('%s %s %s', l:status, l:icon, l:file_path))
			else
				" printf statement contains a load-bearing unicode space
				" the file path is extracted from the list item using {3..-1},
				" this breaks if there is a different number of spaces, which
				" means if we add a space in the following printf it breaks.
				" using a unicode space preserves the spacing in the fzf list
				" without breaking the {3..-1} index
				call add(l:result, printf('%s %s %s', ' ', l:icon, l:file_path))
			endif
			endfor

			return l:result
		endfunction

		function! s:prepend_icon(candidates)
			let l:result = []
			for l:candidate in a:candidates
			let l:filename = fnamemodify(l:candidate, ':p:t')
			let l:icon = Getfiletypesymbol(l:filename)
			call add(l:result, printf('%s %s', l:icon, l:candidate))
			endfor

			return l:result
		endfunction

		function! s:edit_file(lines)
			if len(a:lines) < 2 | return | endif

			let l:cmd = get({'ctrl-x': 'split',
						\ 'ctrl-v': 'vertical split',
						\ 'ctrl-t': 'tabe'}, a:lines[0], 'e')

			for l:item in a:lines[1:]
			let l:pos = strridx(l:item, ' ')
			let l:file_path = l:item[pos+1:-1]
			execute 'silent '. l:cmd . ' ' . l:file_path
			endfor
	endfunction

	call fzf#run({
				\ 'source': <sid>files(),
				\ 'sink*':   function('s:edit_file'),
				\ 'options': '-m --preview-window=right:70%:noborder --prompt Files\> ' . l:fzf_files_options,
				\ 'down':    '40%'})
				" \ ,'window': 'call FloatingFZF()'})

	endfunction


endif
