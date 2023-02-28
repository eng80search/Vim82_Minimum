" --------------------------------------------------------------------------------
"  Vim syntax file
"  filetype:    ruby
"  Last Change: 2022 12 09
" --------------------------------------------------------------------------------
"
" --------------------------------------------------------------------------------

" this file uses line continuations
let s:cpo_sav = &cpo
set cpo&vim

syn match rubyOperator "=>\|+\|-\|=\|&\.\@!\|\%(class\s*\)\@<!<<\|<=>\|<=\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|>=\|=\@1<!>\|\*\*\|\.\.\.\|\.\.\|::"
syn match rubyOperator "->\|-=\|/=\|\*\*=\|\*=\|&&=\|&=\|&&\|||=\||=\|||\|%=\|+=\|!\~\|!="

" 自分好みの色を設定
highlight rubyIdentifier ctermfg=116
highlight rubyFunction cterm=bold ctermfg=153
" highlight rubyConditional cterm=bold ctermfg=yellow
highlight rubyConditional ctermfg=yellow
highlight rubyRepeat cterm=bold ctermfg=cyan
highlight rubyComment ctermfg=darkgray
highlight rubyRegexpComment ctermfg=darkgray
highlight rubyDefine cterm=bold ctermfg=brown

" return rescue break nextなど
highlight rubyExceptional ctermfg=brown
highlight rubyControl ctermfg=brown
highlight rubyException ctermfg=brown

highlight myRubyOperator cterm=bold ctermfg=brown

highlight RubyString ctermfg=180

highlight rubyStringDelimiter ctermfg=brown
" highlight netrwCsharp cterm=bold ctermfg=Green

" Postscript {{{1

let &cpo = s:cpo_sav
unlet! s:cpo_sav

" vim: nowrap sw=2 sts=2 ts=8 noet fdm=marker:
