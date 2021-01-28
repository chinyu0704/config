#!/bin/bash

if [ ! -e ~/.vim ];then
	mkdir -p ~/.vim
fi

cp colors ~/.vim/ -r 
cp plugin ~/.vim/ -r

cp .vimrc ~/ 
