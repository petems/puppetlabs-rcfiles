# This will normally be the backup of the default .bashrc
test -f ~/.bashrc.local && source ~/.bashrc.local

alias ls="ls --color=auto"
alias ll="ls -al"
alias vi="vim"
alias h="history"
alias psu="ps -fu $USER"


PATH="$PATH:$HOME/bin"

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

SSH_ENV=$HOME/.ssh/environment

function start_agent {
  echo "Initialising new SSH agent..."
  ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
  echo succeeded
  chmod 600 ${SSH_ENV}
  . ${SSH_ENV} >& /dev/null
  ssh-add;
}

if [ -t 0 ]
then
  # Check if $HOME/.ssh exists before starting ssh-agent
  if [ -d $HOME/.ssh ]
  then
    # Source SSH settings, if applicable
    if [ -f "${SSH_ENV}" ]; then
      . ${SSH_ENV} >& /dev/null
      #ps ${SSH_AGENT_PID} doesnt work under cywgin
      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ >& /dev/null || {
      start_agent;
    }
    else
      start_agent;
    fi
  fi
fi

# ex: set et sw=2 ts=2 filetype=sh:
