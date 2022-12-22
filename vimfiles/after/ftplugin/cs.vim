" Vim filetype plugin file
" Language: C#
"

if exists("b:did_ftplugin_Cs") | finish | endif
" echo "This is C# ftplugin"
let b:did_ftplugin_Cs = 1

let s:keepcpo = &cpo
set cpo&vim

" echo "**** C# ftplugin"


let b:next='\v^\s*public\s+[^=.]*\(.*\)$|\v^\s*protected\s+[^=.]*\(.*\)$|\v^\s*internal\s+[^=.]*\(.*\)$|\v^\s*private\s+[^=.]*\(.*\)$|\v^\s+static\s+[^=.]*\(.*\)$'
let b:prev=b:next

execute "nnoremap <silent> <buffer> ]] :call <SID>Cs_jump(b:next, 'forward')<CR>"
execute "nnoremap <silent> <buffer> [[ :call <SID>Cs_jump(b:next, 'backward')<CR>"

if !exists('*<SID>Cs_jump')
  fun! <SID>Cs_jump(pattern, mode)
  
    " normal! 0
    "
    if a:mode == 'forward'
      call search(a:pattern)
    else
      call search(a:pattern, 'b')
    endif
    
    " normal! ^
  endfun
endif
