#!/bin/bash

# Open daily notes
terminal-init "nvim $(simple-notes get note) ~/.config/simple-notes/punctual_events.csv" &

# Disable bluetooth
bluetoothctl power off

# Init status bar
dwmblocks &

# Clean qutebrowser cache
clean-qutebrowser-cache

# Set default monitor configuration
autorandr default
