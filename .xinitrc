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

#xmodmap -e "keycode 87 = dead_macron"
#xmodmap -e "keycode 88 = dead_acute"
#xmodmap -e "keycode 89 = dead_caron"
#xmodmap -e "keycode 83 = dead_grave"
xmodmap -e "keycode  10 = 1 exclam 1 exclam dead_macron exclamdown bar"
#xmodmap -e "keycode  10 = 1 exclam 1 exclam bar exclamdown bar"
xmodmap -e "keycode  13 = 4 dollar 4 dollar dead_caron dollar asciitilde"

# Wallpaper
# nitrogen --set-zoom-fill ~/Images/Wallpapers/space1.png
feh --no-fehbg --no-xinerama --bg-fill "/home/adrian/Images/Wallpapers/nebula2.jpeg"

exec dwm
