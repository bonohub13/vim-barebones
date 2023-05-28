" Autocommands
"   source .vimrc on write
augroup SourceVimrc
    autocmd!
    autocmd BufWritePost *vimrc,vim source $MYVIMRC | set foldmethod=marker
augroup END

"   auto close brackets and quotes
augroup CloseBracketOrQuote
    autocmd!
    autocmd FileType lua,vim,html,xml inoremap <buffer> < <><left>
    autocmd FileType * if &ft != 'rust' | inoremap <buffer> ' ''<left>| endif
augroup END
