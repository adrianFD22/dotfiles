#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Launch Polybar
exec polybar
