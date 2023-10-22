#!/bin/bash

# Set default monitor configuration
autorandr default

# Init status bar
dwmblocks &

# Clean qutebrowser cache
clean-qutebrowser-cache
