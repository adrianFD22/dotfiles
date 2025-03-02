#!/bin/bash

# Init status bar
dwmblocks &

# Open daily notes
terminal-init "nvim $(simple-notes get note) ~/.config/simple-notes/punctual_events.csv" &

# Disable bluetooth
bluetoothctl power off

# Run picom
# picom &

# Clean qutebrowser cache
clean-qutebrowser-cache

# Volume
pactl set-sink-mute @DEFAULT_SINK@ 1    # Mute
pulseaudio-ctl set 50                   # Set volume to 50%

# Set default monitor configuration
#autorandr default

# Run qutebrowser
#qutebrowser -d &> qutebrowser.log # It is not working and I dont know why &> qutebrowser.log
