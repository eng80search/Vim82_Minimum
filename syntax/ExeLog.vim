" --------------------------------------------------------------------------------
"  Vim syntax file
"  Language:    ExeLog
"  Last Change: 2022 12 09
" --------------------------------------------------------------------------------
"
" --------------------------------------------------------------------------------

if exists("b:current_syntax")
    finish
endif

" this file uses line continuations
let s:cpo_sav = &cpo
set cpo&vim

syn keyword ExeLogAt 場所
syn match ExeLogTime /\v\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3} .+/ contains=ExeLogMsg
syn match ExeLogMsg  /\v\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3} \zs.+/ contained
syn match ExeLogRowNumber /\v行 \d+/
syn match ExeLogSourceFile /\v\\\zs\w+\.<cs>/
syn match ExeLogFuncName /\v\.\zs\w+\(.*\)/

" 自分好みの色を設定
highlight ExeLogAt ctermfg=lightyellow
highlight ExeLogTime ctermfg=magenta
highlight ExeLogMsg ctermfg=yellow
highlight ExeLogRowNumber cterm=bold ctermfg=cyan
highlight ExeLogSourceFile ctermfg=cyan
highlight ExeLogFuncName ctermfg=lightgreen

" Postscript {{{1
let b:current_syntax = "ExeLog"

let &cpo = s:cpo_sav
unlet! s:cpo_sav

" vim: nowrap sw=2 sts=2 ts=8 noet fdm=marker:
