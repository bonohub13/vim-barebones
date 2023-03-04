" 各種キーバインド一覧
" <モード>noremap   <入力キー>  <実行する内容><CR>
"   ノーマルモードキーバインド一覧
nnoremap qq             :q!<CR>
nnoremap qa             :qa!<CR>
nnoremap <Leader>bn     :bnext<CR>
nnoremap <Leader>bp     :bprevious<CR>
nnoremap <Leader>tt     :tabnew<CR>
nnoremap <Leader>tn     :tabnext<CR>
nnoremap <Leader>tp     :tabprevious<CR>
nnoremap <Leader>st     :term<CR>
nnoremap <Leader>vt     :vert term<CR>

"   挿入モードキーバインド一覧
inoremap [              []<left>
inoremap (              ()<left>
inoremap {              {}<left>
inoremap "              ""<left>
inoremap '              ''<left>

"   ターミナルモードキーバインド一覧
tnoremap <ESC>          <C-\><C-n>
