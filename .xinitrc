#!/bin/bash

# Set default monitor configuration
#autorandr default

# On startup settings
#amixer set Master mute
#pulsemixer --set-volume 50
#xdotool mousemove 1365 767     # Hide cursor
xrdb ~/.Xresources

# Set xnotify FIFO
export XNOTIFY_FIFO="$HOME/.cache/xnotify$DISPLAY.fifo"
rm -f $XNOTIFY_FIFO
mkfifo $XNOTIFY_FIFO
xnotify -s 0 0<>$XNOTIFY_FIFO &

# Keyboard and mouse
setxkbmap -layout es
setxkbmap -option caps:swapescape
xset r rate 300 60

# Wallpaper
# nitrogen --set-zoom-fill ~/Images/Wallpapers/space1.png
feh --no-fehbg --no-xinerama --bg-center "/home/adrian/Images/Wallpapers/shrek.png"

exec dwm
