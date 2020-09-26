let g:dein#auto_recache = 1
let g:dein#install_max_processes = 16
let g:dein#install_progress_type = 'echo'
let g:dein#enable_notification = 0

let s:dein_dir = '$HOME/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim'
if (!isdirectory(expand(s:dein_dir)))
    call system(expand('mkdir -p $HOME/.config/nvim/.cache/dein/repos/github.com'))
    call system(expand('git clone https://github.com/Shougo/dein.vim $HOME/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim'))
endif

set runtimepath+=$HOME/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.config/nvim/.cache/dein')
    call dein#begin('$HOME/.config/nvim/.cache/dein')
    " Startup Plugins
    call dein#add('$HOME/.config/nvim/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('wsdjeg/dein-ui.vim',{'on_cmd':'DeinUpdate'})
    call dein#add('roxma/nvim-yarp',{'if': ! has('nvim'), 'depends': 'vim-hug-neovim-rpc'})
    call dein#add('roxma/vim-hug-neovim-rpc',{ 'if': ! has('nvim')})
    call dein#add('romainl/vim-cool')
    call dein#add('christoomey/vim-tmux-navigator')
    "Color Schemes
    call dein#add('arcticicestudio/nord-vim')
    call dein#add('jaredgorski/spacecamp')
    call dein#add('drewtempelmeyer/palenight.vim')
    "call dein#add('itchyny/lightline.vim',{'merged': 0,'hook_source':'source $HOME/.config/nvim/configs/lightline.vim'})
    "call dein#add('ryanoasis/vim-devicons')

    call dein#add('LinArcX/mpi',{'path':"~/.config/nvim/plugin/mpi"})
    call dein#add('justinmk/vim-gtfo')
    call dein#add('wellle/context.vim',{'merged':0})
    call dein#add('kien/rainbow_parentheses.vim', {'merged': 0})
    call dein#add('liuchengxu/vim-clap',{'merged':0,
				\'hook_post_update':':Clap install-binary!',
			    \'hook_add': "let g:clap_theme = 'material_design_dark'\n
			    \let g:clap_enable_icon = 1\n
			    \let g:clap_search_box_border_style = 'curve'\n
			    \let g:clap_provider_grep_enable_icon = 1\n
			    \highlight! link ClapMatches Function\n
			    \highlight! link ClapNoMatchesFound WarningMsg\n
			    \"})
    " Lazy Loading
    " Javascript
    call dein#add('pangloss/vim-javascript',{'on_ft':['javascript','javascriptreact'],
			    \'hook_add':"let g:javascript_plugin_jsdoc = 1\n
			    \let g:javascript_plugin_flow = 1\n
			    \"})
    call dein#add('MaxMEllon/vim-jsx-pretty',{'on_ft': [ 'javascript', 
			    \'javascriptreact', 'typescriptreact'],
			    \'depends':'vim-javascript',
			    \'hook_add':'let g:vim_jsx_pretty_colorful_config = 1'
			    \})
    call dein#add('elzr/vim-json', {'on_ft': 'json'})
    call dein#add('posva/vim-vue',{'on_ft':'vue'})
    " Python
    call dein#add('vim-python/python-syntax',{'on_ft':'python'})
    call dein#add('Vimjas/vim-python-pep8-indent',{'on_ft':'python'})
    call dein#add('raimon49/requirements.txt.vim', {'on_ft': 'requirements'})
	" Cpp
	call dein#add('octol/vim-cpp-enhanced-highlight',{'on_ft':['c','cpp']})
	"Conky
	call dein#add('smancill/conky-syntax.vim',{'on_ft':'.conkyrc'})
    "NeoVim Plugins
    call dein#add('Shougo/defx.nvim',{'on_cmd':'Defx',
			    \'hook_source':'source $HOME/.config/nvim/configs/defx.vim',
			    \'do':':UpdateRemotePlugins'
			    \})
    call dein#add('kristijanhusak/defx-git', {'on_source':'defx.nvim'})
    call dein#add('kristijanhusak/defx-icons', {'on_source':'defx.nvim'})
    call dein#add('liuchengxu/vim-which-key',{'on_cmd':['WhichKey','WhichKey!']})
    call dein#add('mbbill/undotree',{'on_cmd':'UndotreeToggle'})

	call dein#add('dstein64/vim-startuptime',{'on_cmd':'StartupTime'})
	call dein#add('liuchengxu/vista.vim',{
				\'on_cmd':['Vista','Vista!!'],
				\'hook_add':"
				\let g:vista#renderer#enable_icon = 1\n
				\let g:vista_echo_cursor_strategy = 'floating_win'\n
				\"})
	call dein#add('junegunn/fzf',{
				\'merged':0,
				\'on_cmd':'FZF',
				\'hook_source': "let g:fzf_layout = { 'down': '~45%' }"
				\})
	call dein#add('junegunn/fzf.vim',{
				\'depends':'fzf',
				\'merged':0,
				\'on_cmd':['Files', 'GitFiles', 'Buffers', 'Lines', 'Locate', 'Colors', 'Commands', 'Rg', 'Tags'],
				\'on_func':[ 'fzf#vim#with_preview', 'fzf#run', 'vista#finder#fzf#Run']
				\})

	call dein#add('norcalli/nvim-colorizer.lua',{'if': has('nvim-0.4')
				\,'on_event': 'FileType'
				\,'hook_source':'luafile $VIM_PATH/configs/colorizer.lua'
				\})
	
	" Async Code Completion and Analysis
    call dein#add('neoclide/coc.nvim', {'rev': 'release',
				\'merged':0,
				\'do':'-> coc#util#install',
				\'hook_source':'source $VIM_PATH/configs/coc.vim'})

	call dein#add('honza/vim-snippets',{'if': has('python3'),'merged':0})	
    " Code Editing Plugins
    call dein#add('tpope/vim-commentary')
    call dein#add('tpope/vim-repeat', {'on_map' : '.'})
	call dein#add('tpope/vim-surround', {'on_map': {'n' : ['cs', 'ds', 'ys'], 'x' : 'S'}, 'depends' : 'vim-repeat'})
    call dein#end()
    call dein#save_state()
endif
if dein#check_install()
	call dein#install()
endif
filetype plugin indent on
command! DeinInstall
    \ if dein#check_install() |
    \   call dein#install() |
    \ endif
" Only enable syntax when vim is starting
if has('vim_starting')
	syntax enable
else
	" Trigger source events, only when vimrc is refreshing
	call dein#call_hook('source')
	call dein#call_hook('post_source')
endif
