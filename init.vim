"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc


if &compatible
	" vint: -ProhibitSetNoCompatible
	set nocompatible
	" vint: +ProhibitSetNoCompatible
endif

let $VIM_PATH = '$HOME/.config/nvim/'

function! s:source_file(path,...)
	" let abspath = resolve($VIM_PATH . '/' . a:path)
	" execute 'source' fnameescape(abspath)
	execute 'runtime' fnameescape(a:path)
	return
endfunction
" Initialize startup settings
if has('vim_starting')
	" Required before loading plugins!
	let g:mapleader="\<Space>"
	let g:maplocalleader=','
	" Release keymappings prefixes, evict entirely for use of plug-ins.
	nnoremap <Space>  <Nop>
	xnoremap <Space>  <Nop>
	nnoremap ,        <Nop>
	xnoremap ,        <Nop>
	" au VimEnter * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
	" au VimLeave * :silent !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
endif


" Set custom augroup
augroup user_events
	autocmd!
augroup END


"" Disable vim distribution plugins
"let g:loaded_getscript = 1
"let g:loaded_getscriptPlugin = 1
"let g:loaded_logiPat = 1
"let g:loaded_matchit = 1
let g:loaded_matchparen = 1
"let g:netrw_nogx = 1 " disable netrw's gx mapping.
"let g:loaded_rrhelper = 1  " ?
"let g:loaded_shada_plugin = 1  " ?
"let g:loaded_tutor_mode_plugin = 1
"let g:loaded_2html_plugin = 1
"let g:loaded_vimball = 1
"let g:loaded_vimballPlugin = 1

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

"let $VIM_PATH = '$HOME/.config/nvim/'
"if &runtimepath !~# $VIM_PATH
	"set runtimepath^=$VIM_PATH
"endif

call s:source_file('plugins.vim')
call s:source_file('configs/all.vim')
" runtime plugins.vim
call s:source_file('general.vim')
call s:source_file('keys.vim')
"call s:source_file('configs/lightline.vim')
call s:source_file('funcs.vim')
call s:source_file('mystatus.vim')
call s:source_file('mytab.vim')
