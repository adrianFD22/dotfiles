#!/bin/bash

#
# sunday-routine
#
# Do some actions that I use to do on sundays
#

check-internet () {
    ping -c 1 "google.com" > /dev/null 2>&1
}

sunday-routine () {

    # Check internet connection
    if ! check-internet; then
        echo "No internet connection"
        return 1
    fi

    # Update dotfiles

    # Update system
    pacman -Syu
}
