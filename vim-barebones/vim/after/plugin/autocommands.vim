" 自動実行コマンド一覧
"   vimrc更新時自動読み込み
augroup SourceVimrc
    autocmd!
    autocmd BufWritePost *vimrc,vim source $MYVIMRC | set foldmethod=marker
augroup END

"   HTML/XMLタグ自動挿入
augroup MarkupLang
    autocmd!
    autocmd FileType lua,vim,html,xml inoremap <buffer> < <><left>
augroup END
