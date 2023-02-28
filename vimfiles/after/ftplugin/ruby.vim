" Vim filetype plugin file
" Language: ruby
"
" echo "This is ruby ftplugin"

if exists("b:did_ftplugin_ruby") | finish | endif
    let b:did_ftplugin_ruby = 1

let s:keepcpo = &cpo
set cpo&vim


let b:next='\v^\s*def\s+.+|\v^\s*class\s+.+|\v^\s*module\s+.+'
let b:prev='\v^\s*def\s+.+|\v^\s*class\s+.+|\v^\s*module\s+.+'

execute "nnoremap <silent> <buffer> ]] :call <SID>Ruby_jump(b:next, 'forward')<CR>"
execute "nnoremap <silent> <buffer> [[ :call <SID>Ruby_jump(b:next, 'backward')<CR>"

if !exists('*<SID>Ruby_jump')
  fun! <SID>Ruby_jump(pattern, mode)
  
    " normal! 0

    if a:mode == 'forward'
      " echo "**** call ruby_jump"
      call search(a:pattern)
    else
      call search(a:pattern, 'b')
    endif
    
    " normal! ^
  endfun
endif

let &cpo = s:keepcpo
unlet s:keepcpo
