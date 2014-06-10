#!/bin/bash
# Taken from https://github.com/brantb/dotfiles/blob/master/install.sh

# Run this from the dotfiles dir
DOTFILES=`pwd`

# bash
test -f ~/.bashrc && mv ~/.bashrc ~/.bashrc.local 2> /dev/null
ln -sfn $DOTFILES/bashrc ~/.bashrc
touch ~/.bashrc.local

# vim
test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.old 2> /dev/null
test -d ~/.vim && mv ~/.vim ~/.vim.old 2> /dev/null
ln -sfn $DOTFILES/vimrc ~/.vimrc
ln -sfn $DOTFILES/vim ~/.vim

# screen
test -f ~/.screenrc && mv ~/.screenrc ~/.screenrc.old 2> /dev/null
ln -sfn $DOTFILES/screenrc ~/.screenrc

# tmux
test -f ~/.tmux.conf && mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null
ln -s $DOTFILES/tmux.conf ~/.tmux.conf

# dircolors
#test -f ~/.dir_colors && mv ~/.dir_colors ~/.dir_colors.old 2> /dev/null
#ln -s $DOTFILES/dircolors/dircolors.ansi-dark ~/.dir_colors

ln -sfn $DOTFILES/gemrc ~/.gemrc


#git submodule update --init


