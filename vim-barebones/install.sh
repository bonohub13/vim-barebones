#!/bin/sh -eu

BAR="`printf '=%.0s' {1..10}`"

installed_msg() {
    echo "$1インストール済"
}

finished_install_msg() {
    echo "$1インストール完了"
}

echo "${BAR}===============================${BAR}"
echo "${BAR} vim-barebonesインストール開始 ${BAR}"
echo "${BAR}===============================${BAR}"

if [ $# -gt 0 ] && echo "$1" | grep -iq "^debug$"
then
    echo "DEBUG MODE"
else
    # Copy vimrc to $HOME
    cp -v vimrc "${HOME}/.vimrc"

    # Copy vim to $HOME
    if [ -d "${HOME}/.vim" ]
    then
        cp -vr vim/* "${HOME}/.vim"
    else
        cp -vr vim "${HOME}/.vim"
    fi
fi

echo "${BAR}===============================${BAR}"
echo "${BAR} 依存パッケージインストール    ${BAR}"
echo "${BAR}===============================${BAR}"

if command -v curl > /dev/null
then
    installed_msg "curl"
else
    [ "${HOME}" = "/root" ] \
        && apt install -y curl \
        || sudo apt install -y curl

    finished_install_msg "curl"
fi

if command -v git > /dev/null
then
    installed_msg "git"
else
    [ "${HOME}" = "/root" ] \
        && apt install -y git \
        || sudo apt install -y git

    finished_install_msg "git"
fi

# vim-plugインストール
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

if command -v ctags > /dev/null
then
    installed_msg "ctags"
else
    universal_ctags_compat=0

    if grep -q "Debian" /etc/os-release # Debianである
    then
        if [ `grep "VERSION_ID" /etc/os-release | sed -e "s/.*=//" -e 's/"//g'` -ge 10 ] # Buster以降である
        then
            universal_ctags_compat=1
        fi
    fi
    if [ -f /etc/lsb_release ] # Ubuntu派生である
    then
        if [ `grep "Release" /etc/lsb_release | awk '{print$2}' | sed "s/\.*//"` -ge 20 ] # リリースが20.04 (Focal) 以降である
        then
            universal_ctags_compat=1
        fi
    fi

    if [ ${universal_ctags_compat} -gt 0 ]
    then
        [ "${HOME}" = "/root" ] \
            && apt install -y universal-ctags \
            || sudo apt install -y universal-ctags
    else
        [ "${HOME}" = "/root" ] \
            && apt install -y exuberant-ctags \
            || sudo apt install -y exuberant-ctags
    fi

    finished_install_msg "ctags"
fi

# 完了メッセージ
echo "${BAR}===============================${BAR}"
echo "${BAR} vim-barebonesインストール完了 ${BAR}"
echo "${BAR}===============================${BAR}"
