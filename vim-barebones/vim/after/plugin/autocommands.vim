" Autocommands
"   source .vimrc on write
augroup SourceVimrc
    autocmd!
    autocmd BufWritePost *vimrc,vim source $MYVIMRC | set foldmethod=marker
augroup END

"   auto close tags for HTML/XML
augroup MarkupLang
    autocmd!
    autocmd FileType lua,vim,html,xml inoremap <buffer> < <><left>
augroup END
