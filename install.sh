#!/bin/bash
# Author:1657301947@qq.com

ln -srf .vimrc ~
[ -d ~/.vim ] || mkdir ~/.vim
[ -d ~/.vimundo ] || mkdir ~/.vimundo
ln -srf autoload ~/.vim
