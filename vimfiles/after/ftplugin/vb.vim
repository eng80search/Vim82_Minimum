" Vim filetype plugin file
" Language: vb
"

if exists("b:did_ftplugin_vb") | finish | endif
" echo "This is Vb ftplugin"
let b:did_ftplugin_vb = 1

let s:keepcpo = &cpo
set cpo&vim

" echo "**** Vb ftplugin"


let b:next='\v^\s*public\s+(sub|function)|\v^\s*protected\s+(sub|function)|\v^\s*private\s+(sub|function)|\v^\s*friend\s+(sub|function)|\v^\s+(sub|function)'
let b:prev='\v^\s*public\s+(sub|function)|\v^\s*protected\s+(sub|function)|\v^\s*private\s+(sub|function)|\v^\s*friend\s+(sub|function)|\v^\s+(sub|function)'

let b:next.='|\v^\s*(sub|function)'
let b:prev.='|\v^\s*(sub|function)'

execute "nnoremap <silent> <buffer> ]] :call <SID>Vb_jump(b:next, 'forward')<CR>"
execute "nnoremap <silent> <buffer> [[ :call <SID>Vb_jump(b:next, 'backward')<CR>"

if !exists('*<SID>Vb_jump')
  fun! <SID>Vb_jump(pattern, mode)
  
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

" エラーがある場合のみエラーリストを表示
function! Qfsetlist()

  let qflist = getqflist()
  if len(qflist) > 0
    call setqflist([], 'r', {'title': 'Compile NG'})
    copen
    
  else
    call setqflist([], 'a', {'title': 'Compile OK'})
    echo "----Compile OK----"
    cclose
  endif
  
  " コマンドプロンプトのencodingをcp932に戻す
  execute "!~/chcp932.bat"
endfunction

" makeする前にコマンドプロンプトのencodingをutf8に設定
" defaultのcp932の場合は、makeすると文字化けするのでその防止策である
function! ChangeEncToUtf8()
  execute "!~/chcp65001.bat"
endfunction

" 二重読み込み防止のため、augroupを作成
augroup vbMake
  autocmd!
  au QuickfixCmdPost make call Qfsetlist()
  au QuickFixCmdPre make call ChangeEncToUtf8()
augroup END

let &cpo = s:keepcpo
unlet s:keepcpo
