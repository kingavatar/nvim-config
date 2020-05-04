function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.'  ':''
endfunction


function! SetFiletype(filetype) " {{{
  if isdirectory(expand('%:t'))
  	  return ' ' . 'directory'
  elseif a:filetype == ''
      return '-'
  else
      return mpi#get(expand('%:t')) . ' ' . a:filetype
  endif
endfunction

function! Getfiletypesymbol(filename)
	if isdirectory(a:filename)
		return ''
	else
		return mpi#get(a:filename)
	endif
endfunction
function s:getDistro()
  if exists('s:distro')
    return s:distro
  endif

  if executable('lsb_release')
    let s:lsb = system('lsb_release -i')
    if s:lsb =~# 'Arch'
      let s:distro = ''
    "elseif s:lsb =~# 'Manjaro'
     " let s:distro = ''
    elseif s:lsb =~# 'Ubuntu'
      let s:distro = ''
    elseif s:lsb =~# 'Cent'
      let s:distro = ''
    elseif s:lsb =~# 'Debian'
      let s:distro = ''
    elseif s:lsb =~# 'Dock'
      let s:distro = ''
    else
      let s:distro = ''
    endif
    return s:distro
  endif

  let s:distro = ''
  return s:distro
endfunction

function! GetfileformatSymbol()
	let fileformat = ''
	if &fileformat ==? 'dos'
		let fileformat = ''
	elseif &fileformat ==? 'unix'
		if has('macunix')
			let fileformat = ''
		else
			let fileformat = s:getDistro()
		endif
	elseif &fileformat ==? 'mac'
		let fileformat = ''
	endif
	return fileformat
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif
