#
#       v0.1
#               - Add chnangelog
#       v0.2
#               - Prompt color correction
#       v0.3
#               - ls -lAh
#               - update_bashrc function
#       v0.4
#       	- Odebrani debian_chroot
#       	- Prizpusobeni pro Arch, Hyprland, Kitty
#       	- RGB barvy
#       v0.5
#       	- Modernizace PS1
#       v0.6
#       	- Odprizpusobeni pro Arch, Hyprland, Kitty
#       	- Snad uz vyresene barvy
#       	- root username ma jinou barvu promptu
#
#	TODO
#		- funkce, ktera /usr/local/bin zkrati na /u/l/bin

##
##              UPDATE FUNCTION


f_update_bashrc() {
        curl https://raw.githubusercontent.com/MartusDortus/dotfiles/master/.bashrc
}

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

COLOR_RED="\[\033[1;31m\]"
COLOR_GREEN="\[\033[1;32m\]"
COLOR_YELLOW="\[\033[1;33m\]"
COLOR_BLUE_THIN="\[\033[0;34m\]"
COLOR_BLUE="\[\033[1;34m\]"
COLOR_PURPLE="\[\033[1;35m\]"
COLOR_CYAN="\[\033[1;36m\]"
COLOR_WHITE="\[\033[1;37m\]"
COLOR_GRAY="\[\033[0;32m\]"
COLOR_NO="\[\033[m\]"

HISTCONTROL=ignoreboth  # Do not hist duplicate lines or space starting lines
HISTFILESIZE=2000       # lines

shopt -s histappend     # append to the history file, don't overwrite it
shopt -s checkwinsize   # After every command recheck window size

##
##       PROMPT

function nonzero_return() {
	RETVAL=$?
	[ $RETVAL -ne 0 ] && echo "[$RETVAL]"
}

PROMPT_NONZERO_RETURN="${COLOR_GREEN}\`nonzero_return\`"
PROMPT_SHELL_LVL="${COLOR_GREEN}[${SHLVL}]"
if [[ $(whoami) == "root" ]]; then
	PROMPT_USER="${COLOR_RED}\u"
else
	PROMPT_USER="${COLOR_BLUE}\u"
fi
PROMPT_PWD="${COLOR_BLUE_THIN}\W"
PROMPT_PROMPT="${COLOR_GREEN}$"

PS1="${PROMPT_NONZERO_RETURN}${PROMPT_SHELL_LVL} ${PROMPT_USER} ${PROMPT_PWD} ${PROMPT_PROMPT} ${COLOR_NO}"

##
##       ALIASES

##      functions
alias update_bashrc="f_update_bashrc"

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

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
