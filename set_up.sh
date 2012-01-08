#!/bin/bash

[ -f ~/.vimrc ] && mv ~/.vimrc ~/.vimrc.bkp
ln -s ~/.vim/vimrc ~/.vimrc
