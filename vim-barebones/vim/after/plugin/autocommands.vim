" 自動実行コマンド一覧
"   vimrc更新時自動読み込み
augroup SourceVimrc
    autocmd!
    autocmd BufWritePost *vimrc,vim source $MYVIMRC | set foldmethod=marker
augroup END

"   括弧・クオートの自動閉じ
augroup CloseBracketOrQuote
    autocmd!
    autocmd FileType lua,vim,html,xml inoremap <buffer> < <><left>
    autocmd FileType * if &ft != 'rust' | inoremap <buffer> ' ''<left>| endif
augroup END

"   言語を日本語に設定
augroup LangJapanese
    autocmd!
    autocmd VimEnter language 'ja_JP.UTF-8'
augroup END
