#!/bin/bash
# Taken from https://github.com/brantb/dotfiles/blob/master/install.sh

# Run this from the dotfiles dir
DOTFILES=`pwd`

# bash
if [ ! -f ~/.bashrc.local ]
then
  test -f ~/.bashrc && mv ~/.bashrc ~/.bashrc.local 2> /dev/null
  ln -sfn $DOTFILES/bashrc ~/.bashrc
  touch ~/.bashrc.local
fi

# vim
if [ ! -f ~/.vimrnc.old ]
then
  test -f ~/.vimrc && mv ~/.vimrc ~/.vimrc.old 2> /dev/null
  ln -sfn $DOTFILES/vimrc ~/.vimrc
  touch ~/.vimrc.old
fi
if [ ! -f ~/.vim.old ]
then
  test -d ~/.vim && mv ~/.vim ~/.vim.old 2> /dev/null
  ln -sfn $DOTFILES/vim ~/.vim
  touch ~/.vim.old
fi

# screen
if [ ! -f ~/.screenrc.old ]
then
  test -f ~/.screenrc && mv ~/.screenrc ~/.screenrc.old 2> /dev/null
  ln -sfn $DOTFILES/screenrc ~/.screenrc
  touch ~/.screenrc.old
fi

# tmux
if [ ! -f ~/.tmux.conf.old ]
then
  test -f ~/.tmux.conf && mv ~/.tmux.conf ~/.tmux.conf.old 2> /dev/null
  ln -s $DOTFILES/tmux.conf ~/.tmux.conf
  touch ~/.tmux.conf.old
fi

# dircolors
#if [ ! -f ~/.dir_colors.old ]
#then
#  test -f ~/.dir_colors && mv ~/.dir_colors ~/.dir_colors.old 2> /dev/null
#  ln -s $DOTFILES/dircolors/dircolors.ansi-dark ~/.dir_colors
#  touch ~/.dir_colors.old
#fi

if [ ! -f ~/.gemrc.old ]
then
  test -f ~/.gemrc && mv ~/.gemrc ~/.gemrc.old 2> /dev/null
  ln -s $DOTFILES/gemrc ~/.gemrc
  touch ~/.gemrc.old
fi

#git submodule update --init


