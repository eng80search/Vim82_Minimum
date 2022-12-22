## Git付帯の最小限機能vimの設定

このスクリプトはGitの付属されているVimに対してのカスタマイズ用の設定である。  
開発環境は外のネットワークに接続できなくて、vimはこれしかない絶望の環境でも  
上の設定を手入力することによってそんなに不満なくvimを使いこなすことができる。

---
#### Plugin関係(単体ファイルなので頑張って入力すればよい)
---

**commentary.vim**  

     コメント作成用  
**surround.vim**  

     括弧をつけたり、削除したり、変更したりする  

**vim-simple-complete.vim**  

     入力単語補完用 

[リンク]

  [commentary Github](https://github.com/tpope/vim-commentary)

  [surround Github](https://github.com/tpope/vim-surround)

  [vim-simple-complete Github](https://github.com/maxboisvert/vim-simple-complete)

---
#### 知っておきたい便利なコマンド
---

- **:shell**<br>
    (VimからgitBash抜ける。)
- **exit**<br>
    (gitBashからVimへ戻る。)
- **:mksession! ~/SessionName.vim**<br>
    (現在のセッションを保存する。読み込む際にはvim -S ~/SessionName.vim)
- **:bro ol**<br> 
    (過去開いたファイルの履歴を表示する。)  
    (開く際には 例：:tabe #<1)
- **Netrwについて**<br>
    BookMarkを一覧を開く :qb 特定のBookMarkへ移動する 3gb
- **grep**したあとに検索結果に対して置換を行う。<br>
    **:vim /pattern/j ../*.c<br>**
    **:cdo s//new_pattern/c**
- **曖昧検索**でファイルを開く<br> 
    :find abc.txt  
    事前準備： set path+=../**
- **terminal**で現在の文字コードを変更(bat実行時にutf8のままだと文字化けするので)<br>
    1. 現在の文字コードを確認  
    `$chcp.com`  
    1. UTF-8に変更  
    `$chcp 65001`  
    1. Shift-JISに変更  
    `$chcp 932`  
