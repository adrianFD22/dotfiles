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
        "/home/adrian/.config/dmenu/"
        "/home/adrian/.config/dwmblocks/"
        "/home/adrian/.config/dwm/"
        "/home/adrian/.config/st/"
        "/home/adrian/.config/picom"
        "/home/adrian/.local/bin/scripts"
    )

    declare -a dotfile_files=(
        "/home/adrian/.gitignore"
        "/home/adrian/.xinitrc"
        "/home/adrian/.Xresources"
        "/home/adrian/.bash_profile"
        "/home/adrian/.bashrc"
        "/home/adrian/.inputrc"
        "/home/adrian/.config/lesskey"
        "/home/adrian/.config/mimeapps.list"
    )

    echo "Add dirs"
    for dir in ${dotfile_dirs[*]}; do
        echo -n -e "\t"
        echo "$dir"
        dotfiles add $dir
    done

    echo "Add files"
    for file in ${dotfile_files[*]}; do
        echo -n -e "\t"
        echo "$file"
        dotfiles add $file
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

update-sunday () {
    echo "> Update system"
    echo

    yay -Syu
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
    update-sunday
}
