#!/bin/bash

# Find the dotfiles dir
DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd -P )"

function create_link() {
  SOURCE="$1"
  FILE="$2"
  SUFFIX="$3"
  if [ -h ~/.$FILE ]
  then
    echo "WARNING: ~/.${FILE} is a symlink. Skipping it"
    return
  fi
  if [ -f ~/.$FILE  -o -d ~/.$FILE ]
  then
    mv ~/.$FILE{,.$SUFFIX}
  fi
  ln -sfn $SOURCE/$FILE ~/.$FILE
}

# bash
create_link $DOTFILES bashrc local

# vim
create_link $DOTFILES vimrc old
create_link $DOTFILES vim old

# screenc
create_link $DOTFILES screenrc old

# tmux
create_link $DOTFILES tmux.conf old

# gemrc
create_link $DOTFILES gemrc old



