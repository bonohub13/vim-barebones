" LSP (言語サーバプロトコル) の有効化
"   引数:
"       lspname: LSPの名前
"       language: 言語 (プログラミング言語)
"       cmd: LSPを行うソフトウェア (ほとんどの場合、lspnameと同じ)
function! EnableLSP(lspname, languanges, cmd)
    if executable(a:lspname)
        au User lsp_setup call lsp#register_server({
            \ 'name': a:lspname,
            \ 'cmd': {server_info->[a:cmd]},
            \ 'allowlist': a:languages,
            \ })
    endif
endfunction

" LSPが有効化されたあとに実行されるコマンド一覧
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

" スコープに含まれる内容を折りたたむ
set foldmethod=expr
    \ foldexpr=lsp#ui#vim#folding#foldexpr()
    \ foldtext=lsp#ui#vim#folding#foldtext()

"   Debian Busterでclangdを使いたい場合
" let g:lsp_settings = {
"     \   'clangd': {'cmd': ['clangd-11']},
"     \ }
" call EnableLSP('clangd',
"     \   ['c', 'cpp'],
"     \   'clangd-11'
"     \ )

call EnableLSP('vim-language-server', 
    \   ['vim'],
    \   'vim-language-server'
    \ )
call EnableLSP('bash-language-server', 
    \   ['bash', 'sh', 'shellscript'], 
    \   'bash-language-server'
    \ )
call EnableLSP('clangd',
    \   ['c', 'cpp'],
    \   'clangd'
    \ )

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
