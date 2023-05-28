" カスタムコマンド一覧
"   Vimrcコマンド
"       vimrcファイルを表示する
command! Vimrc e ~/.vimrc

"   Makeコマンド
"       Vimのコマンドモード標準のmakeコマンドとは異なりターミナル上の
"       makeコマンドと同等のmakeコマンドを実行することができる。
"       ビルドしている様子はsplitしたウィンドウ上で表示される。
"       注意: makeコマンドが実行中のバッファ・ウィンドウを閉じるとビルドが
"             中断されてしまう。
"       使用例: Make build <- これは:!make buildと同等
command! -nargs=1 Make term ++noclose make <q-args>

"   Catコマンド
"       Vimでcatコマンドの出力を表示することを可能とする。
"       使用例：Cat <ファイル名> <- これは:split term ++noclose cat <ファイル名>
"                                   と同等
command! -nargs=1 -complete=file Cat term ++noclose cat <q-args>
command! -nargs=1 -complete=file VCat vsplit term ++noclose cat <q-args>
command! -nargs=1 -complete=file TCat tabnew term ++noclose cat <q-args>
