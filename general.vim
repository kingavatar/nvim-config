"colorscheme nord
"colorscheme Tomorrow-Night-Bright
"colorscheme Tomorrow-Night-Blue
"colorscheme spacecamp
" set background=dark
set t_Co=256
" let g:palenight_terminal_italics=1
" colorscheme palenight
let g:material_theme_style = 'palenight-community'
let g:material_terminal_italics = 1
colorscheme material
" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
au ColorScheme * hi Normal ctermbg=None guibg=None
set scrolloff=1              " Always show at least one line above/below the cursor
set sidescrolloff=5          " Always show at least one line left/right of the cursor
set nocursorline             " Highlight the line on which the cursor lines
set mouse=a                  " Enable mouse in command-line mode
set errorbells               " Trigger bell on error
set visualbell               " Use visual bell instead of beeping
set hidden                   " hide buffers when abandoned instead of unload
set magic                    " For regular expressions turn magic on
set virtualedit=block        " Position cursor anywhere in visual block
set formatoptions+=1         " Don't break lines after a one-letter word
set formatoptions-=t         " Don't auto-wrap text
set autoread      			 " Set to auto read when a file is changed from the outside


if has('patch-7.3.541')
	set formatoptions+=j       " Remove comment leader when joining lines
endif

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8

	" Enables 24-bit RGB color in the TUI
	if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
		set termguicolors
	endif
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
endif

if has('clipboard') && has('vim_starting')
	set clipboard& clipboard+=unnamedplus
endif

" WildMenu
if has('wildmenu')
	if ! has('nvim')
		set wildmode=list:longest
	endif

	" if has('nvim')
	" 	set wildoptions=pum
	" else
	" 	set nowildmenu
	" 	set wildmode=list:longest,full
	" 	set wildoptions=tagfile
	" endif
	set wildignorecase
	set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
	set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
	set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
	set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
	set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
	set wildcharm=<C-z>  " substitue for 'wildchar' (<Tab>) in macros
endif

set history=2000
set undolevels=1000 " use many muchos levels of undo
set noexpandtab     " Don't expand tabs to spaces
set tabstop=4       " The number of spaces a tab is
set smarttab        " Tab insert blanks according to 'shiftwidth'
set autoindent      " Use same indenting on new lines
set smarttab        " Tab insert blanks according to 'shiftwidth'
set copyindent    " copy the previous indentation on autoindenting
set number        " Always show line numbers
set showcmd       " Show the command being entered in the status bar
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  " case-sensitive otherwise
set nobackup
set nowritebackup
set nowrap        " don't wrap lines
set autowrite     " save before commands like : next,: make
"set ttyfast       " Indicates a fast terminal connection
highlight Comment cterm=italic
set splitbelow              " Open new splits below
set splitright              " Open new vertical splits to the right
set hlsearch      			" highlight search terms
set incsearch     			" show search matches as you type
set inccommand=nosplit
set title         			" change the terminal's title
set ruler         			" Always show current position

if has('persistent_undo')      "check if your neovim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.config/nvim/undo  "directory where the undo files will be stored
endif
