#!/bin/bash

#
# sunday-routine
#
# Do some actions that I use to do on sundays
#

# Confirm user selection between yes and no
confirm () {
    read -p "[Y/n] " opt

    case $opt in
        y | Y | yes | YES) return 0;;
        *) return 1;;
    esac
}

check-internet () {
    ping -c 1 "google.com" > /dev/null 2>&1
}

dotfiles-sunday () {
    declare -a dotfile_dirs=(
        "/home/adrian/.config/alacritty/"
        "/home/adrian/.config/bashrc/"
        "/home/adrian/.config/fzf/"
        "/home/adrian/.config/i3/"
        "/home/adrian/.config/nnn/"
        "/home/adrian/.config/nvim/"
        "/home/adrian/.config/polybar/"
        "/home/adrian/.config/qutebrowser/"
        "/home/adrian/.config/tmux/"
        "/home/adrian/.config/zathura/"
    )

    echo "Add"
    for dir in ${dotfile_dirs[*]}; do
        echo -n -e "\t"
        echo "$dir"
        dotfiles add $dir
    done

    echo

    dotfiles status

    echo
    echo -n "Commit? "
    if confirm; then

        # Commit
        read -p "Commit message: " message
        dotfiles commit -am "$message"

        # Push
        echo "Push"
        echo
        dotfiles push origin main
    fi;
}

pacman-sunday () {
    echo "> Update system"
    echo

    pacman -Syu
}

sunday-routine () {

    # Check internet connection
    if ! check-internet; then
        echo "No internet connection"
        return 1
    fi

    # Update dotfiles
    echo "> Update dotfiles"
    echo
    dotfiles-sunday

    # Update system
    pacman-sunday
}
