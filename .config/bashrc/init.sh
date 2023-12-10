#!/bin/bash

### EXPORT
export FILES="n"
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export VISUAL="nvim"
export PAGER="less"

export HISTSIZE=20000
export LESS="-iR --incsearch --search-options=W"

### BASH PROMPT
PS1='\[\e[90m\][\u@\H] \[\e[0m\]\W \[\e[33m\]$(git branch 2>/dev/null | grep ^* | colrm 1 2)\n\[\e[33;1m\]> \[\e[0m\]'
PROMPT_COMMAND="export PROMPT_COMMAND=echo"

### CONFIG
#set -o vi      # Not using this since .inputrc set vi mode more globally

### ALIASES
alias maple='~/.repos/maple2022/bin/maple'
alias cal='cal -m'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias hgrep='history | grep $@'
alias clear="unset PROMPT_COMMAND; clear -x; PROMPT_COMMAND='export PROMPT_COMMAND=echo'"
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias fzf='fzf --bind="alt-j:down,alt-k:up"'

# confirm before overwriting something
alias cp="cp -i"
alias mv='mv -i'
# alias rm='rm -i'

### FUNCTIONS
# usage: ex <file> <dir>
ex () {
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf "$1"   ;;
      *.tar.gz)    tar xzf "$1"   ;;
      *.bz2)       bunzip2 "$1"   ;;
      *.rar)       unrar x "$1"   ;;
      *.gz)        gunzip "$1"    ;;
      *.tar)       tar xf "$1"    ;;
      *.tbz2)      tar xjf "$1"   ;;
      *.tgz)       tar xzf "$1"   ;;
      *.zip)       unzip "$1"     ;;
      *.Z)         uncompress "$1";;
      *.7z)        7z x "$1"      ;;
      *.deb)       ar x "$1"      ;;
      *.tar.xz)    tar xf "$1"    ;;
      *.tar.zst)   unzstd "$1"    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# GAP
gap () {
    /usr/bin/gap -b -L /home/adrian/Work/GAP/Workspaces/vanilla "$@"
}

# Spawn terminal in the same path
term () {
    $TERMINAL & disown
}
