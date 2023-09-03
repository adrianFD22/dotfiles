#!/bin/bash

## fzf
source ~/.config/fzf/key-bindings.sh
#source ~/.config/fzf/completion.sh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#282828,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

fcd() {
  local cmd opts dir
  cmd="${FZF_ALT_C_COMMAND:-"command find -L . -mindepth 1 \\( -path '*/\\.*' -o -fstype 'sysfs' -o -fstype 'devfs' -o -fstype 'devtmpfs' -o -fstype 'proc' \\) -prune \
    -o -type d -print 2> /dev/null | cut -b3-"}"
  opts="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore --reverse ${FZF_DEFAULT_OPTS-} ${FZF_ALT_C_OPTS-} +m"
  dir=$(eval "$cmd" | FZF_DEFAULT_OPTS="$opts" $(__fzfcmd)) && cd -- "$dir"
}

# fzy
#fcd(){
  #cd "$(find -type d | fzy)"
#}
