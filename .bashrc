# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Colours
#color_yellow="\[\033[33;1m\]"
#color_red="\[\033[31;1m\]"
#color_green="\[\033[32;1m\]"
#color_blue="\[\033[34;1m\]"
#color_pink="\[\033[35;1m\]"
#color_azure="\[\033[36;1m\]"
#color_white="\[\033[37;1m\]"

color_red='\033[0;31m'
color_green='\033[0;32m'
color_brown='\033[0;33m'
color_blue='\033[0;34m'
color_pink='\033[0;35m'
color_azure='\033[0;36m'
color_white='\033[0;37m'
color_yellow='\033[0;93m'

HISTCONTROL=ignoreboth  # Do not hist duplicate lines or space starting lines
HISTFILESIZE=2000       # lines

shopt -s checkwinsize   # After every command recheck window size

PS1="[${SHLVL}] ${debian_chroot:+($debian_chroot)}${color_yellow}\u${color_red}@${color_yellow}\h:${color_blue}\w\[\033[00m\]\$ "

alias l="ls -la"
alias v="vim"
alias s="ssh"
