#!/bin/sh
set -e

if [[ -f ~/.vimrc ]]; then
    cp ~/.vimrc ~/.vimrc.bak
fi

cd ~/.vim_runtime

vundle_dir=plugins/Vundle.vim
[ -d "${vundle_dir}" ] && rm -rf "${vundle_dir}"
git clone https://github.com/VundleVim/Vundle.vim.git plugins/Vundle.vim

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
' > ~/.vimrc

vim +PluginInstall +qall

echo "Installed the Vim configuration successfully! Enjoy :-)"
