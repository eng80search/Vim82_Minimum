" echo "readed qf plugin!"
if exists("b:did_ftplugin_qf") | finish | endif
let b:did_ftplugin_qf = 1

" open new tab
nnoremap <silent> <buffer> t <C-w><CR><C-w>T
