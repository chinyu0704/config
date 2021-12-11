#!/bin/sh

if [ ! -e ~/.vim ];then
	mkdir -p ~/.vim
fi

if [ ! -e ~/.vim/bundle/Vundle.vim ];then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

cp vimrc ~/.vimrc
cp inputrc ~/.inputrc
cp gitconfig ~/.gitconfig


