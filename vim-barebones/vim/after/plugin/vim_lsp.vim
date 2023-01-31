function! EnableLSP(lspname, languanges, cmd)
    if executable(a:lspname)
        au User lsp_setup call lsp#register_server({
            \ 'name': lspname,
            \ 'cmd': {server_info->[a:cmd]},
            \ 'allowlist': languages,
            \ })
    endif
endfunction

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes

    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs, *.go call execute('LspDocumentFormatSync')

endfunction

set foldmethod=expr
    \ foldexpr=lsp#ui#vim#folding#foldexpr()
    \ foldtext=lsp#ui#vim#folding#foldtext()

call EnableLSP('vim-language-server', ['vim'], 'vim-language-server')
call EnableLSP('clangd', ['c, cpp'], 'clangd-11')

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:s:on_lsp_buffer_enabled()
augroup END
