#!/bin/bash


# ------------------------
#         General
# ------------------------

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Bash prompt
PS1='\[\e[90m\][\u@\H] \[\e[0m\]\W \[\e[33m\]$(git branch 2>/dev/null | grep ^* | colrm 1 2)\n\[\e[33;1m\]> \[\e[0m\]'
PROMPT_COMMAND="export PROMPT_COMMAND=echo"

# Historial size
HISTSIZE=20000

# Enable vi mode
set -o vi


# ------------------------
#       Environment
# ------------------------

export FILES="n"
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="qutebrowser"
export VISUAL="nvim"
export PAGER="less"


# ------------------------
#         Aliases
# ------------------------

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias battery='cat /sys/class/power_supply/BAT0/capacity'
alias hgrep='history | grep $@'
alias cl="unset PROMPT_COMMAND; clear -x; PROMPT_COMMAND='export PROMPT_COMMAND=echo'"
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'


# ------------------------
#        Functions
# ------------------------

# Whatsapp
function whatsapp {
    $BROWSER https://web.whatsapp.com/ --target window
}

# GAP
function gap {
    /usr/bin/gap -b -L /home/adrian/Work/GAP/Workspaces/vanilla "$@"
}
