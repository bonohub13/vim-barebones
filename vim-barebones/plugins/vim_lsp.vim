" Enable LSP (Language Server Protocol)
"   variables:
"       lspname: Name of LSP
"       language: List of programming languages
"       cmd: Command to run (Most of the time, it is same as lspname)
function! EnableLSP(lspname, languages, cmd)
    if executable(a:lspname)
        call lsp#register_server({
            \ 'name': a:lspname,
            \ 'cmd': {server_info->[a:cmd]},
            \ 'allowlist': a:languages,
            \ })
    endif
endfunction

" Commands to run after the initialization of LSP
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

" Fold code based on scopes
set foldmethod=expr
    \ foldexpr=lsp#ui#vim#folding#foldexpr()
    \ foldtext=lsp#ui#vim#folding#foldtext()

"   Setup for clangd on Debian Buster
" let g:lsp_settings = {
"     \   'clangd': {'cmd': ['clangd-11']},
"     \ }
" call EnableLSP('clangd',
"     \   ['c', 'cpp'],
"     \   'clangd-11'
"     \ )

augroup VimLspSetup
    au!
    au User lsp_setup call EnableLSP('vim-language-server', 
        \   ['vim'],
        \   'vim-language-server'
        \ )
    au User lsp_setup call EnableLSP('bash-language-server', 
        \   ['bash', 'sh', 'shellscript'], 
        \   'bash-language-server'
        \ )
    au User lsp_setup call EnableLSP('clangd',
        \   ['c', 'cpp'],
        \   'clangd'
        \ )
augroup END

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
