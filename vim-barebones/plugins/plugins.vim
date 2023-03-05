"   Auto updating plugins when writing .vimrc
augroup AutoupdatePlugins
    autocmd!
    autocmd BufWritePost, *vimrc nested :PlugUpdate
augroup END

" tagbar setup
let g:tagbar_ctags_bin='/usr/bin/ctags'     " path of ctags
let g:tagbar_width=25                       " width of tagbar

"   Auto open tagbar
augroup AutoTagbar
    autocmd!
    autocmd VimEnter,TabNew * nested :TagbarOpen
augroup END

"   FZF plugin keybind
nnoremap <Leader>ff     :FZF<CR>
