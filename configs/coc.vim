let g:coc_global_extensions =  [
			 \'coc-github'
			 \,'coc-tabnine'
			 \,'coc-git'
			 \,'coc-vetur'
			 \,'coc-java'
			 \,'coc-python'
			 \,'coc-pairs'
			 \,'coc-snippets'
			 \,'coc-prettier'
			 \,'coc-flutter'
			 \,'coc-texlab'
			 \,'coc-tsserver'
			 \,'coc-html'
			 \,'coc-css'
			 \,'coc-eslint'
			 \,'coc-emoji'
			 \]
" \,'coc-highlight'
let b:defx_git_loaded = 1 " Don't load the defx-git plugin file, not needed
set cmdheight=2  " Give more space for displaying messages.
set updatetime=300
set shortmess+=c  " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes  " Always show the signcolumn, otherwise it would shift the text each time
					" diagnostics appear/become resolved.

