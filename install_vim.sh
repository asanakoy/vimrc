#!/bin/sh
set -e

cp ~/.vimrc ~/.vimrc.bak

cd ~/.vim_runtime
git clone https://github.com/VundleVim/Vundle.vim.git plugins/Vundle.vim

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/basic.vim
' > ~/.vimrc

vim +PluginInstall +qall

echo "Installed the Vim configuration successfully! Enjoy :-)"
