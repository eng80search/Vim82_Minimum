" --------------------------------------------------------------------------------
"  Vim syntax file
"  filetype:    netrw
"  Last Change: 2022 12 09
" --------------------------------------------------------------------------------
"
" --------------------------------------------------------------------------------

" this file uses line continuations
let s:cpo_sav = &cpo
set cpo&vim

syn match netrwFolder /\v\w+\/$/

syn match netrwExe /\v.+\.exe\*?$/
syn match netrwDll /\v.+\.dll\*?$/
syn match netrwPdb /\v.+\.pdb$/
syn match netrwOthers /\v.+\.(cache|zip)\*?$/

syn match netrwXml /\v.+\.xml\*?$/
syn match netrwConfig /\v\w+\.config\*?$/
syn match netrwLog /\v\w+\.log\*?$/
syn match netrwBat /\v\w+\.bat\*?$/

syn match netrwRb /\v\w+\.rb$/
syn match netrwCsharp /\v\w+\.cs$/
syn match netrwCsharpProj /\v\w+\.csproj$/

" 自分好みの色を設定
highlight netrwFolder cterm=bold ctermfg=lightyellow

highlight netrwExe ctermfg=lightgray
highlight netrwDll ctermfg=gray
highlight netrwPdb ctermfg=gray
highlight netrwOthers ctermfg=gray

highlight netrwXml ctermfg=lightblue
highlight netrwConfig ctermfg=yellow
highlight netrwLog ctermfg=lightyellow
highlight netrwBat ctermfg=brown

highlight netrwRb ctermfg=red
highlight netrwCsharp ctermfg=darkgreen
highlight netrwCsharpProj ctermfg=darkmagenta

" Postscript {{{1

let &cpo = s:cpo_sav
unlet! s:cpo_sav

" vim: nowrap sw=2 sts=2 ts=8 noet fdm=marker:
