" Vim filetype plugin file
" Language: Python
"
" echo "This is Python ftplugin"

if exists("b:did_ftplugin_Python") | finish | endif
let b:did_ftplugin_Python = 1

let s:keepcpo = &cpo
set cpo&vim


let b:func_next='\v^\s*def\s+\w+\(.+\):'
let b:class_next='\v^\s*class\s+.+:'
let b:next=b:func_next.'|'.b:class_next

execute "nnoremap <silent> <buffer> ]] :call <SID>Python_jump(b:next, 'forward')<CR>"
execute "nnoremap <silent> <buffer> [[ :call <SID>Python_jump(b:next, 'backward')<CR>"

execute "nnoremap <silent> <buffer> ]} :call <SID>Python_jump(b:class_next, 'forward')<CR>"
execute "nnoremap <silent> <buffer> [{ :call <SID>Python_jump(b:class_next, 'backward')<CR>"

if !exists('*<SID>Python_jump')
  fun! <SID>Python_jump(pattern, mode)

    " normal! 0

    if a:mode == 'forward'
      " echo "**** call Python_jump"
      call search(a:pattern)
    else
      call search(a:pattern, 'b')
    endif

    " normal! ^
  endfun
endif

let &cpo = s:keepcpo
unlet s:keepcpo
