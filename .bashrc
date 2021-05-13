# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

color_red='\033[0;31m'
color_green='\033[0;32m'
color_brown='\033[0;33m'
color_blue='\033[0;34m'
color_magenta='\033[0;35m'
color_cyan='\033[0;36m'
color_white='\033[0;37m'
color_gray='\033[0;90m'
color_yellow='\033[0;93m'


HISTCONTROL=ignoreboth  # Do not hist duplicate lines or space starting lines
HISTFILESIZE=2000       # lines

shopt -s histappend     # append to the history file, don't overwrite it
shopt -s checkwinsize   # After every command recheck window size

PS1="[${SHLVL}] ${debian_chroot:+($debian_chroot)}${color_yellow}\u${color_red}@${color_yellow}\h:${color_blue}\w\[\033[00m\]\$ "

alias l="ls -la"
alias ll="ls -la"
alias v="vim"
alias sv="sudo vim"
alias s="ssh"

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
