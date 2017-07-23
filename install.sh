#!/bin/bash
# Author:1657301947@qq.com

ln -srf linvim/.vimrc ~
[ -d ~/.vim ] || mkdir ~/.vim
ln -srf linvim/autoload ~/.vim
