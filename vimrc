set number
set runtimepath+=$HOME/.vim/vimfiles
set runtimepath+=$HOME/.vim/vimfiles/after
set nocompatible

" テーマが反映されていない場合は次の設定をする
set t_Co=256
" テーマを指定
" colorscheme elflord
colorscheme myColors

" 英語版のhelpを優先
set helplang=en,ja

" 検索設定
nnoremap / /\v
set incsearch

" argdoのための設定
set hidden

" 自動保存を有効化(makeもしくは!外部コマンドを実行する際に、
" 変更がると自動的に保存してからこれらのプログラムを実行する)
set autowrite
set autoread

" タブ設定
noremap <Tab> gt<CR>
noremap <S-Tab> gT<CR>
" タブページを常に表示
set showtabline=2

" beep音と画面の点滅をさせない
set visualbell t_vb=

" 起動時のメッセージを表示しない
set shortmess+=I

" 検索したら次の検索ところにジャンプしない
nmap * *N

" StatusLine Setting
set  statusline=%F%r%6n(BufNo.)%8L(TotalRow)%8p%%%8l,%c%=TYPE=%y[FENC=%{&fenc}]

set enc=utf-8
set fileencodings=utf-8,cp932,sjis
set nowrap
set hlsearch
set ignorecase
set cursorline

set backup
set backupdir=~/.vim/tmp/backup

set viminfo+=n~/.vim/tmp/viminfo/viminfo.txt

if has('persistent_undo')
    set undodir=~/.vim/tmp/undo
    set undofile
endif

" swapファイルを作成する
set swapfile
set directory=~/.vim/tmp/swp


" カレントディレクトリを開いたファイルのディレクトリに変更する
set autochdir
set laststatus =2

noremap <S-h> ^
noremap <S-l> $

noremap <S-f> <C-e>
noremap <S-b> <C-y>

noremap <C-j> <C-d>
noremap <C-k> <C-u>

noremap <silent><S-m> :call cursor(0,strlen(getline("."))/2)<CR>

" 画面のスクロール
nnoremap <silent>,h H
nnoremap <silent>,l L
nnoremap <silent>,m M

" Explore関係　現在のファイルがあるディレクトリを開く
nnoremap <silent><C-e> :lcd %:h<CR>:25Vexplore <CR>

" ウィンドウ関係
set splitbelow
set splitright

" Vim8.0関連
set so=0

" プラグインを有効にする
filetype plugin indent on
runtime macros/matchit.vim

" インデントをTabではなくスペース4つで揃える
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" insertモードを抜ける
inoremap <C-o> <C-[>

" insertモードで括弧補完
inoremap { {}<ESC>i
inoremap {<Enter> {}<Left><CR><ESC><S-o><Tab>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o><Tab>
inoremap [ []<ESC>i
inoremap [<Enter> []<Left><CR><ESC><S-o><Tab>
inoremap < <><ESC>i
inoremap <<Enter> <><Left><CR><ESC><S-o><Tab>

inoremap ' ''<ESC>i
inoremap " ""<ESC>i

" insertモードでhjklで移動
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-b> <BS>

" insertモードでカーソルの形を変更
if has('vim_starting')
    " 挿入モード時に非点滅の縦棒タイプのカーソル
    let &t_SI .= "\e[6 q"
    " ノーマルモード時に非点滅のブロックタイプのカーソル
    let &t_EI .= "\e[2 q"
    " 置換モード時に非点滅の下線タイプのカーソル
    let &t_SR .= "\e[4 q"
endif

" ウィンドウサイズ調整
set cmdwinheight=15

" ウィンドウサイズ調整
noremap <C-Up> <C-w>-
noremap <C-Down> <C-w>+
noremap <C-Left> <C-w><
noremap <C-Right> <C-w>>

" バッファ関連設定
noremap <C-n> :exe("bn!")<CR>
noremap <C-p> :exe("bp!")<CR>
noremap <C-d> :exe("bd!")<CR>

" ファイルの履歴表示
noremap <C-h> :exe("bro ol")<CR>

" VimのWindowサイズを変更する際に、複数のWindowsの場合は、高さ、幅を均等にする
augroup ReduceNoise
    autocmd!
    autocmd VimResized * :call ResizeSplits()
augroup END

function! ResizeSplits()
    wincmd =
endfunction

" コマンド、検索などの履歴情報の記録数を設定
set history=10000

hi TabLine term=bold cterm=bold ctermfg=248 ctermbg=239
hi TabLineSel term=bold cterm=bold,underline ctermfg=220 ctermbg=black
hi TabLineFill term=bold cterm=bold ctermfg=28 ctermbg=250
set tabline=%!MakeTabLine()

function! s:tabpage_label(n)
    " n番目のタブのラベルを返す
    " t:titleと言う変数があったらそれを使う
    let title = gettabvar(a:n, 'title')
    if title !=# ''
        return title
    endif
    
    " タブページ内のバッファリスト
    let bufnrs = tabpagebuflist(a:n)
    
    " カレントタブページかどうかでハイライトを切り替える
    let hi = a:n is tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
    
    " バッファが複数あったらバッファ数を表示
    let no = len(bufnrs)
    if no is 1
        let no = ''
    endif
    " タブページ内に変更ありのバッファがあったら'+'を付ける
    let mod = len(filter(copy(bufnrs), 'getbufvar(v:val, "&modified")')) ? '(変更)' : ''
    let sp = (no . mod) ==# '' ? '' : ' ' "隙間空ける
    
    " カレントバッファ
    let curbufnr = bufnrs[tabpagewinnr(a:n) - 1]  " tabpagewinnr()は1 origin
    let fname = fnamemodify(bufname(curbufnr), ":t")
    let bufnum = '['.curbufnr.']'
    
    let label = mod . sp . bufnum . fname
    
    return '%' . a:n . 'T' . hi . label . '%T%#TabLineFill#'
endfunction

function! MakeTabLine()
    let titles = map(range(1, tabpagenr('$')), 's:tabpage_label(v:val)')
    let sep = '|' " タブ間の区切り
    let tabpages = join(titles, sep). sep . '%#TabLineFill#%T'
    " タブページ内のバッファリスト
    let bufcnt = len(filter(range(1,bufnr('$')), 'buflisted(v:val)'))
    let info  = 'BuffCnt:' . bufcnt
    
    return tabpages . '%=' . info " タブリストを左に、情報を右に表示
endfunction

" 挿入、ノーマルモードでステータスラインの色を変える
let g:hi_insert= 'highlight StatusLine gui=bold guifg=white guibg=darkred cterm=bold ctermfg=white ctermbg=Blue'
if has('syntax')
    augroup InsertHook
        autocmd!
        autocmd InsertEnter * call s:StatusLine('Enter')
        autocmd InsertLeave * call s:StatusLine('Leave')
    augroup END
endif

let s:slhlcmd = ''
let s:mode = ''
function! s:StatusLine(mode)
    if s:mode == a:mode
        return
    endif
    silent! let s:mode = a:mode
    if a:mode == 'Enter'
        silent! let s:slhlcmd= 'highlight ' . s:GetHighlight('StatusLine')
        silent exec g:hi_insert
    else
        highlight clear StatusLine
        silent exec s:slhlcmd
    endif
endfunction

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
    return hl
endfunction


augroup sessionStart
    autocmd!
    autocmd SessionLoadPost * so ~/.vim/vimrc
augroup END

augroup quickfixOpen
    autocmd!
    autocmd QuickfixCmdPost grep,grepadd,vimgrep copen
augroup END

augroup comment
    autocmd!
    autocmd FileType vb setlocal commentstring='\ %s
    autocmd FileType sql setlocal commentstring=--\ %s
    autocmd FileType asp setlocal commentstring=<%--\ %s\ --%>
    autocmd FileType aspvbs setlocal commentstring=<%--\ %s\ --%>
    autocmd FileType dosbatch setlocal commentstring=rem\ %s
    autocmd FileType gitconfig setlocal commentstring=#\ %s
augroup END

augroup msbuild
    " visual studio msbuild Setting
    autocmd BufNewFile,BufRead *.vbproj,*.xaml setf xml
    autocmd BufNewFile,BufRead *.vbproj,*.vb,*.cs compiler msbuild
augroup END

" current_word plugin Setting
let g:vim_current_word#enabled = 1
let g:vim_current_word#highlight_current_word = 0
let g:vim_current_word#highlight_only_in_focused_window = 1
let g:vim_current_word#highlight_delay = 500
" vim_current_word setting in cui mode
hi CurrentWord ctermbg=53
hi CurrentWordTwins ctermbg=245

" AutoSave plugin Setting
" disable AutoSave on Vim startup
let g:auto_save = 0
" do not save while in insert mode
let g:auto_save_in_insert_mode = 0
" do not display auto-save time
" let g:auto_save_silent = 1


" 後書き
" このスクリプトはGitの付属されているVimに対してのカスタマイズ用の設定である。
" 開発環境は外のネットワークに接続できなくて、vimはこれしかない絶望の環境でも
" 上の設定を手入力することによってそんなに不満なくvimを使いこなすことができる

" Plugin関係(単体ファイルなので頑張って入力すればよい)
" commentary.vim -> コメント作成用 https://github.com/tpope/vim-commentary
" surround.vim -> 括弧をつけたり、削除したり、変更したりする https://github.com/tpope/vim-surround
" vim-simple-complete.vim -> 補完用 https://github.com/maxboisvert/vim-simple-complete

" 知っておきたい便利なコマンド
" :shell (VimからgitBash抜ける。)
" %exit  (gitBashからVimへ戻る。)
" :mksession! ~/SessionName.vim (現在のセッションを保存する。読み込む際にはvim -S ~/SessionName.vim)
" :bro ol (過去開いたファイルの履歴を表示する。開く際には 例：:tabe #<1)
" Netrwについて BookMarkを一覧を開く :qb 特定のBookMarkへ移動する 3gb
" 曖昧検索でファイルを開く :find abc.txt 事前準備： set path+=../**
" ターミナル関連の設定(Vim内部でcomandを立ち上げて、バッチを実行すると
" 文字化けしているので、その際には文字コードをShift-JISに変更する)

" 現在の文字コード取得
" $chcp.com

" UTF-8に変更
" $chcp 65001

" Shift-JISに変更
" $chcp 932

" netrwを開いたり閉じたりする関数
let g:vexplore_width = 25
function! NetrwToggle()

    " 現在のタブ及びWindowを退避する
    let l:current_win_id = win_getid()
    let l:current_tabnr = tabpagenr()

    " 現在のwindowがnetrwの場合は、閉じて終了する
    if &filetype == "netrw"
        execute "clo"
        return 0
    endif

    " 全windowを対象に処理を実施
    for item in getwininfo()

        let l:tabnr = item.tabnr

        " 現在のタブでのみ処理を実行
        if l:tabnr == l:current_tabnr

            " echo "winid is " . item.winid . " bufname is " . bufname(item.bufnr)
            call win_gotoid(item.winid)

            let l:filetype = &filetype
            " echo "filetype is " . l:filetype

            " windowがnetrwのwindowかを判断
            if l:filetype == "netrw"
                " netrwを閉じる
                execute "clo"
                " 何回か保存するとbuftype=nofileに設定され、保存できない場合は以下の設定を適応
                call win_gotoid(l:current_win_id)
                set buftype=
                return 0
            endif

        endif

    endfor

    " 退避したwindowに戻る
    call win_gotoid(l:current_win_id)

    " 全体幅の20%幅でnetrwを開く
    if g:vexplore_width != ''
        execute "Vexplore " . g:vexplore_width
    else
        execute "Vexplore 20"
    endif

endfunction

" 関数呼び出しための設定
command! NetrwToggleCmd call NetrwToggle()
nnoremap <silent><C-e> :NetrwToggleCmd<CR>
