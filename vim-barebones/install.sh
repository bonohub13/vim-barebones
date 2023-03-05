#!/bin/sh -eu

BAR="`printf '=%.0s' {1..10}`"

installed_msg() {
    echo "$1インストール済"
}

finished_install_msg() {
    echo "$1インストール完了"
}

install_ctags() {
    universal_ctags_compat=0

    if command -v ctags > /dev/null
    then
        universal_ctags_compat=2
        installed_msg "ctags"
    elif grep -q -i "debian" /etc/os-release
    then
        # Debianである
        if [ `grep "VERSION_ID" /etc/os-release | sed -e "s/.*=//" -e 's/"//g'` -ge 10 ]
        then
            # Buster以降である
            universal_ctags_compat=1
        fi
    elif [ -f /etc/lsb-release ]
    then
        # Ubuntu派生である
        if [ `grep "RELEASE" /etc/lsb-release | awk -F= '{print$2}' | sed "s/\..*//"` -ge 20 ]
        then
            # リリースが20.04 (Focal) 以降である
            universal_ctags_compat=1
        fi
    fi

    case ${universal_ctags_compat} in
        0)
            [ "${HOME}" = "/root" ] \
                && apt install -y exuberant-ctags \
                || sudo apt install -y exuberant-ctags
            finished_install_msg "ctags"
            ;;
        1)
            [ "${HOME}" = "/root" ] \
                && apt install -y universal-ctags \
                || sudo apt install -y universal-ctags
            finished_install_msg "ctags"
            ;;
        *)
            ;;
    esac


    return $?
}

plugins() {
    echo "${BAR}==============================${BAR}"
    echo "${BAR}  プラグイン用のパッチ適用中  ${BAR}"
    echo "${BAR}==============================${BAR}"

    cat vimrc.plugins | tee -a "${HOME}/.vimrc" > /dev/null
    find plugins -type f | while read file
    do
        if echo "$file" | awk -F/ '{print$NF}' | grep -q "^keybinds\.vim$"
        then
            cat "$file" \
                | tee -a "${HOME}/.vim/after/plugin/keybinds.vim" > /dev/null
        else
            cp -v "$file" "${HOME}/.vim/after/plugin/"
        fi
    done

    echo "${BAR}==============================${BAR}"
    echo "${BAR} プラグイン用のパッチ適用完了 ${BAR}"
    echo "${BAR}==============================${BAR}"

    return $?
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

if echo "$1" | grep -iq "^plugins$"
then
    plugins

    echo "${BAR}========================================${BAR}"
    echo "${BAR} プラグイン用依存パッケージインストール ${BAR}"
    echo "${BAR}========================================${BAR}"

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

    if command -v fzf > /dev/null
    then
        installed_msg "fzf"
    else
        [ "${HOME}" = "/root" ] \
            && apt install -y fzf \
            || sudo apt install -y fzf
    fi

    if command -v cargo > /dev/null
    then
        installed_msg "cargo"
    else
        [ "${HOME}" = "/root" ] \
            && apt install -y cargo \
            || sudo apt install -y cargo

        finished_install_msg "cargo"
    fi

    if command -v npm > /dev/null
    then
        installed_msg "npm"
    else
        [ "${HOME}" = "/root" ] \
            && apt install -y npm \
            || sudo apt install -y npm

        finished_install_msg "npm"
    fi

    install_ctags
fi

# 完了メッセージ
echo "${BAR}===============================${BAR}"
echo "${BAR} vim-barebonesインストール完了 ${BAR}"
echo "${BAR}===============================${BAR}"
