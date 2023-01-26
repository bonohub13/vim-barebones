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
