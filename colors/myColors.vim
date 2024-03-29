" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer: Ron Aaron <ron@ronware.org>
" Last Change: 2022-09-14

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

" ここからがカスタマイズした部分 Start
let g:colors_name = "myColors"
set t_Co=256
hi Normal ctermfg=231 ctermbg=235 cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=240 cterm=NONE
hi CursorLineNr ctermfg=184 ctermbg=240 cterm=bold
" hi CursorColumn ctermfg=NONE ctermbg=237 cterm=NONE
hi LineNr ctermfg=102 ctermbg=235 cterm=NONE
hi Search ctermbg=222
hi csRepeat ctermfg=82
hi link csConditional csRepeat
hi csComment ctermfg=65 ctermbg=NONE cterm=NONE
" 補完ポップアップメニューの色を設定
hi Pmenu ctermfg=231 ctermbg=238 cterm=NONE
hi PmenuSel ctermfg=231 ctermbg=Blue cterm=NONE
" アクティブステータスラインを設定
hi StatusLine ctermfg=White ctermbg=60 cterm=bold

" diffの色設定
hi DiffAdd    cterm=bold ctermfg=10 ctermbg=17
hi DiffDelete cterm=bold ctermfg=10 ctermbg=167
hi DiffChange cterm=bold ctermfg=10 ctermbg=58
hi DiffText   cterm=bold ctermfg=10 ctermbg=125
" ここまでがカスタマイズした部分 End

" 次の行をコメントアウト　それ以降はelflord.vimと同じ
" hi Normal  guifg=cyan   guibg=black

" hi Comment term=bold  ctermfg=DarkCyan  guifg=#80a0ff
hi Comment term=bold  ctermfg=DarkGray  guifg=#80a0ff
hi Constant term=underline ctermfg=Magenta  guifg=Magenta
hi Special term=bold  ctermfg=DarkMagenta guifg=Red
hi Identifier term=underline cterm=bold   ctermfg=Cyan guifg=#40ffff
hi Statement term=bold  ctermfg=Yellow gui=bold guifg=#aa4444
hi PreProc term=underline ctermfg=LightBlue guifg=#ff80ff
hi Type term=underline  ctermfg=LightGreen guifg=#60ff60 gui=bold
hi Function term=bold  ctermfg=White guifg=White
hi Repeat term=underline ctermfg=White  guifg=white
hi Operator    ctermfg=Red   guifg=Red
hi Ignore    ctermfg=black  guifg=bg
hi Error term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi link String Constant
hi link Character Constant
hi link Number Constant
hi link Boolean Constant
hi link Float  Number
hi link Conditional Repeat
hi link Label  Statement
hi link Keyword Statement
hi link Exception Statement
hi link Include PreProc
hi link Define PreProc
hi link Macro  PreProc
hi link PreCondit PreProc
hi link StorageClass Type
hi link Structure Type
hi link Typedef Type
hi link Tag  Special
hi link SpecialChar Special
hi link Delimiter Special
hi link SpecialComment Special
hi link Debug  Special
