#
#	Version 0.1
#		- Add chnangelog
#
#	Version 0.2
#		- Prompt color correction
#
#
#
#	 TODO: if root: cerveny@cerveny
#

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

color_red='\033[0;31m'
color_green='\033[0;32m'
color_brown='\033[0;33m'
color_blue='\033[0;33m'
color_magenta='\033[0;35m'
color_cyan='\033[0;36m'
color_white='\033[0;37m'
color_gray='\033[0;90m'
color_yellow='\033[0;93m'


HISTCONTROL=ignoreboth  # Do not hist duplicate lines or space starting lines
HISTFILESIZE=2000       # lines

shopt -s histappend     # append to the history file, don't overwrite it
shopt -s checkwinsize   # After every command recheck window size

##
##       PROMPT
  

# set variable identifying the chroot you work in
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
   debian_chroot=$(cat /etc/debian_chroot)
fi

PS1="[${SHLVL}] ${debian_chroot:+($debian_chroot)}${color_yellow}\u${color_red}@${color_yellow}\h:${color_blue}\w\[\033[00m\]\$ "

##
##       ALIASES


##      grep
alias grep="grep --color=auto"
alias egrep="egrep --color=auto"

##      ls
alias ls="ls --color=auto -h"
alias ll="ls -lAh"
alias l=ll

##      vim
alias v="vim"
alias sv="sudo vim"

##      ssh
alias s="ssh"

##      nload
alias nload="nload -i 750000 -o 750000 -t 75"

# if [ -f ~/.bash_aliases ]; then
#   .~/.bash_aliases
# fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
