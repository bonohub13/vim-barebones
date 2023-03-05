"   プラグイン自動アップデート
augroup AutoupdatePlugins
    autocmd!
    autocmd BufWritePost, *vimrc nested :PlugUpdate
augroup END

" tagbar用設定
"   設定定義
let g:tagbar_ctags_bin='/usr/bin/ctags'     " ctagsバイナリの場所
let g:tagbar_width=25                       " tagbarの幅

"   tagbar自動展開
augroup AutoTagbar
    autocmd!
    autocmd VimEnter,TabNew * nested :TagbarOpen
augroup END

"   FZF用のショーカットキー
nnoremap <Leader>ff     :FZF<CR>
