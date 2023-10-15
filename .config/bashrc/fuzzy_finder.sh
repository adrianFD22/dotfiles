#!/bin/bash

## fzf
source ~/.config/fzf/key-bindings.sh
#source ~/.config/fzf/completion.sh

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#282828,hl+:#fabd2f
    --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54'

fcd() {
    builtin cd $(fzf-dir)
}

fhistory() {
  local output opts script
  opts="--height ${FZF_TMUX_HEIGHT:-40%} --bind=ctrl-z:ignore ${FZF_DEFAULT_OPTS-} -n2..,.. --scheme=history --bind=ctrl-r:toggle-sort ${FZF_CTRL_R_OPTS-} +m --read0"
  script='BEGIN { getc; $/ = "\n\t"; $HISTCOUNT = $ENV{last_hist} + 1 } s/^[ *]//; print $HISTCOUNT - $. . "\t$_" if !$seen{$_}++'
  output=$(
    builtin fc -lnr -2147483648 |
      last_hist=$(HISTTIMEFORMAT='' builtin history 1) perl -n -l0 -e "$script" |
      FZF_DEFAULT_OPTS="$opts" $(__fzfcmd) --query "$READLINE_LINE"
  ) || return
  READLINE_LINE=${output#*$'\t'}
  echo $READLINE_LINE
  #if [[ -z "$READLINE_POINT" ]]; then
     #eval "$READLINE_LINE"
  #else
    #READLINE_POINT=0x7fffffff
  #fi
}

# fzy
#fcd(){
  #cd "$(find -type d | fzy)"
#}
