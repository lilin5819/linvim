#!/bin/bash
# Author:1657301947@qq.com

[ -d ~/.vim ] && mv ~/.vim ~/.vim`date +"%m%d"`.bak || rm ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -srf ./vimrc ~/.vim/vimrc
