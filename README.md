# VIM-barebones

## VIM-barebonesとはなんぞや?
VIM-barebonesはVimをインターネット環境を使用することができない環境下 \
でも快適に、生産性が高い理想の開発環境を整える試みである。 \
外部のプラグインを使用しないことを前提とし、人気のVSCodeや \
IDE (統合開発環境) に負けない利便性と快適性の両立を目指す。 \
なお、LSP (Language Server Protocol) 等の便利機能を使用するためにやむなく \
外部プラグインを導入する場合はプラグイン等が保管される`${HOME}/.vim` \
ディレクトリをバックアップし、外部での使用を可能とする。

vim-barebonesの構造
```
vim
└── after
    └── plugin
        ├── airline.vim
        ├── asyncomplete.vim
        ├── autocommands.vim
        ├── commands.vim
        ├── keybinds.vim
        ├── plugins.vim
        └── vim_lsp.vim
```

## VIM-barebonesの開発
VIM-barebonesの開発を行う際は`vim-barebones`のDockerfileを用いて行う。 \
vim-barebonesには必要な最小限のソフトウェアのみがインストールされ、 \
必要なソフトウェアがある場合インストール用スクリプト`install.sh`に追加し、 \
Dockerfileに依存ソフトウェアを追加し、更新すること。 \
なお前提として使用する環境はDebian系 (Debian Buster以降) のLinux \
ディストリビューションとする。 \
その他のLinuxディストリビューション (RHEL系、Archlinux系、Gentoo系) \
を使用する場合、別途個人で依存ソフトウェアのインストールが必要である。 \
また、本Dockerイメージ (vim-barebones) のブランチは更新日時とする。 \
    例) 更新日時が2023/01/23の場合、`vim-barebones:20230123`となる

## インストール方法
1. まず、パッケージを展開する必要があるため、以下のコマンドで展開を行う。
    ``` bash
    tar xzvf vim-barebones-YYYYMMDD.tar.gz
    ```
2. インストールをする際にはvim-barebones内の`./install`を実行する。
    ``` bash
    cd vim-barebones && ./install.sh
    ```
    - また、サードパーティ製プラグインを使用したい場合以下のコマンドを実行する。 \
    (まだない)
        ``` bash
        cd vim-barebones && ./install.sh plugins
        ```

## リリースビルド作成
VIM-barebonesのリリース用ビルドを作成する場合tar.gz形式でパッケージングを行う。 \
なお、リリース用ビルドは`make`のオプションとして用意するため、以下のコマンドを \
実行することでリリース用ビルドを作成することができる。
``` bash
make release
```
