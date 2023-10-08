#!/bin/bash

# Toggle zathura color (this is a mess)
export ZATHURA_DARK=${ZATHURA_DARK:-1}

# Tabbed integration
#zathura() {
    #if ! [ -s "/tmp/zathura-tabbed.xid" ]; then
        #tabbed -c "zathura" "$@" "-e" > /tmp/zathura-tabbed.xid
        #rm /tmp/zathura-tabbed.xid
    #else
        #zathura "$@" -e "$(</tmp/zathura-tabbed.xid)"
    #fi
#}
