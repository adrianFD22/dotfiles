#!/bin/bash

# Disable bluetooth
bluetoothctl power off

# Init status bar
dwmblocks &

# Clean qutebrowser cache
clean-qutebrowser-cache

# Open daily notes
terminal-init "nvim $(simple-notes get note) ~/.config/simple-notes/punctual_events.csv"

# Set default monitor configuration
autorandr default
