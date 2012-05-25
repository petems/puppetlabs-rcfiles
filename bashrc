# This will normally be the backup of the default .bashrc
test -f ~/.bashrc.local && source ~/.bashrc.local

alias ll="ls -al"
alias vi="vim"
alias h="history"
alias psu="ps -fu $USER"


if [ "$SHELL" = "/bin/bash" ]
then
  # Change the window title of X terminals
  case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*|interix)
      PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
      ;;
    screen*)
      PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\033\\"'
      ;;
  esac

  if [[ ${EUID} == 0 ]] ; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
  else
    PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \W \$\[\033[00m\] '
  fi
fi

# ex: set et sw=2 ts=2 filetype=sh:
