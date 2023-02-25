function! s:check_back_space() abort
    let col = col('.') - 1

    return !col || getline('.')[col - 1] =~ '\s'
endfunction

" asyncomplete.vim (code completion)
let g:asyncomplete_auto_popup = 0   " Show completion options only when tab key
                                    " is pressed

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ asyncomplete#force_refresh()
inoremap <expr>         <S-Tab>
    \ pumvisible() ? "<C-p>"  : "\<C-h>"
inoremap <expr>         <cr>
    \ pumvisible() ? asyncomplete#close_popup() : "\<cr>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
