# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Colours
color_yellow="\[\033[29;1m\]"
color_red="\[\033[31;1m\]"
color_green="\[\033[32;1m\]"
color_blue="\[\033[34;1m\]"
color_pink="\[\033[35;1m\]"
color_azure="\[\033[36;1m\]"
color_white="\[\033[37;1m\]"

HISTCONTROL=ignoreboth  # Do not hist duplicate lines or space starting lines
HISTFILESIZE=2000       # lines

shopt -s checkwinsize   # After every command recheck window size

PS1="[${SHLVL}] ${debian_chroot:+($debian_chroot)}${color_red}\u@${color_green}\h:${color_blue}\w\[\033[00m\]\$ "

alias l="ls -la"
alias v="vim"
