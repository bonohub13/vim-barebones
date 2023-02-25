# VIM-barebones

## What is VIM-barebones?
VIM-barebones aims for the creation of a coding environment with Vim \
that does not require internet. \
Using minimal plugins and match or exceed the usability of popular \
text editors (such as VSCode) and IDEs (Integrated Development Environment). \
When adding plugins such as LSPs and code completions to extend the \
usability of Vim, it must be able to export the plugins and automate the \
installation process of its dependencies into a single tar.gz file.

File structure of vim-barebones
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

## The development of VIM-barebones
When developing VIM-barebones, it is to be developed inside a docker container \
using the `Dockerfile.vim-barebones` file. \
Inside the docker container, all of the nesessary dependencies are to be installed \
and the dependencies must also be added to the installation script `install.sh`. \
The target distribution are Debian (Debian Buster and later) based distributions. \
If using other distributions that are based on RHEL, Arch Linux, Gentoo, etc \
manual installation of dependencies is required. \
The naming convention for the branch of individual docker images are of below: \
- e.g. Run `make build-image` at 2023/01/23 &rarr; image name: `vim-barebones:20230123`

## Installation
1. Extract the package with the following command
    ``` bash
    tar xzvf vim-barebones-YYYYMMDD.tar.gz
    ```
2. Run the installation script `install.sh` with the following command
    ``` bash
    cd vim-barebones && ./install.sh
    ```

## Creating release builds
Packaging and creation of release builds of VIM-barebones are done in a tar.gz \
file format. \
When creating release builds, it is done using Make and can be done with the \
following command.

``` bash
make release
```
