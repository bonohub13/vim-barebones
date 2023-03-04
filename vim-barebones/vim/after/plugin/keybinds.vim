" Keybinds
" <mode>noremap   <key>  <command><CR>
"   Keybinds for normal mode
nnoremap qq             :q!<CR>
nnoremap qa             :qa!<CR>
nnoremap <Leader>bn     :bnext<CR>
nnoremap <Leader>bp     :bprevious<CR>
nnoremap <Leader>tt     :tabnew<CR>
nnoremap <Leader>tn     :tabnext<CR>
nnoremap <Leader>tp     :tabprevious<CR>
nnoremap <Leader>st     :term<CR>
nnoremap <Leader>vt     :vert term<CR>

"   Keybinds for insert mode
inoremap [              []<left>
inoremap (              ()<left>
inoremap {              {}<left>
inoremap "              ""<left>
inoremap '              ''<left>

"   Keybinds for terminal mode
tnoremap <ESC>          <C-\><C-n>
