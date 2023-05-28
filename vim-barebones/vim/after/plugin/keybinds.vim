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

"   Keybinds for terminal mode
tnoremap <ESC>          <C-\><C-n>

"   無効化するキー
inoremap <F2>           <Nop>
cnoremap <F2>           <Nop>
inoremap <F3>           <Nop>
cnoremap <F3>           <Nop>
inoremap <F4>           <Nop>
cnoremap <F4>           <Nop>
inoremap <F5>           <Nop>
cnoremap <F5>           <Nop>
inoremap <F6>           <Nop>
cnoremap <F6>           <Nop>
inoremap <F7>           <Nop>
cnoremap <F7>           <Nop>
inoremap <F8>           <Nop>
cnoremap <F8>           <Nop>
inoremap <F9>           <Nop>
cnoremap <F9>           <Nop>
inoremap <F10>          <Nop>
cnoremap <F10>          <Nop>
inoremap <F11>          <Nop>
cnoremap <F11>          <Nop>
inoremap <F12>          <Nop>
cnoremap <F12>          <Nop>
inoremap <F16>          <Nop>
cnoremap <F16>          <Nop>
