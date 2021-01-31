#!/bin/sh

if [ ! -e ~/.vim ];then
	mkdir -p ~/.vim
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

cp .vimrc ~/ 
