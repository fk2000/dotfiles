#!/bin/bash

# エラー用 echo [赤・太字]
function echo_error_ { echo -e "\e[1;31m$*\e[m"; }

# [Git] ローカル設定
if [ ! -e ~/.gitconfig.local ]; then
    # ローカル設定を退避、なければテンプレート配置
    # TODO : includeがループする場合がある
    if [ -e ~/.gitconfig ]; then
        cp $HOME/.gitconfig $HOME/.gitconfig.local
    else
        cp $HOME/dotfiles/.gitconfig.local $HOME/.gitconfig.local
    fi
fi

# Link
DOT_FILES=( \
    .vim \
    .vimrc \
    .gitconfig \
    .gitattributes_global \
    .bashrc \
    .gdbinit \
    .tmux.conf \
)

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# [Vim] NeoBundle の設定
if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    # Check ~/.vim/bundle
    [ ! -d ~/.vim/bundle] && mkdir -p ~/.vim/bundle
    # Install NeoBundle
    git clone https://github.com/Shougo/neobundle.vim.git ~/.vim/bundle/neobundle.vim
    if [ $? -ne 0 ]; then
        echo_error_ " ----------------------------------------------------------------------- "
        echo_error_ "  Install NeoBundle failed."
        echo_error_ "  Please check .gitconfig.local(proxy setting) or your network settings"
        echo_error_ " ----------------------------------------------------------------------- "
        # Exit shell
        exit 0
    fi
fi
