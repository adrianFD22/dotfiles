#!/bin/bash

# On startup settings
amixer set Master mute
xdotool mousemove 1365 767
xrdb ~/.Xresources

## Set xnotify FIFO
export XNOTIFY_FIFO="$HOME/.cache/xnotify$DISPLAY.fifo"
rm -f $XNOTIFY_FIFO
mkfifo $XNOTIFY_FIFO
xnotify -s 0 0<>$XNOTIFY_FIFO &

# Keyboard and mouse
setxkbmap -option caps:swapescape
xset r rate 300 60

# Wallpaper
# nitrogen --set-zoom-fill ~/Images/Wallpapers/space1.png
feh --no-fehbg --bg-fill ~/Images/Wallpapers/memento-mori

exec dwm
