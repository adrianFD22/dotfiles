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
    ping -c 1 "8.8.8.8" > /dev/null 2>&1
    #ping -c 1 "google.com" > /dev/null 2>&1
}

dotfiles-sunday () {
    declare -a dotfile_dirs=(
        "/home/adrian/.config/alacritty/"
        "/home/adrian/.config/bashrc/"
        "/home/adrian/.config/dmenu/"
        "/home/adrian/.config/dwmblocks/"
        "/home/adrian/.config/dwm/"
        "/home/adrian/.config/fzf/"
        "/home/adrian/.config/i3/"
        "/home/adrian/.config/nnn/"
        "/home/adrian/.config/nvim/"
        "/home/adrian/.config/pandoc/"
        "/home/adrian/.config/picom/"
        "/home/adrian/.config/polybar/"
        "/home/adrian/.config/qutebrowser/"
        "/home/adrian/.config/tmux/"
        "/home/adrian/.config/zathura/"
        "/home/adrian/.local/bin/scripts"
    )

    declare -a dotfile_files=(
        "/home/adrian/.gitignore"
        "/home/adrian/.xinitrc"
        "/home/adrian/.xawtv"
        "/home/adrian/.Xresources"
        "/home/adrian/.bash_profile"
        "/home/adrian/.bashrc"
        "/home/adrian/.inputrc"
        "/home/adrian/.config/lesskey"
        "/home/adrian/.config/mimeapps.list"
        "/home/adrian/.config/ipython_config.py"
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

recompile-zathura () {
    sudo pacman -S zathura
    (cd "/home/adrian/.repos/zathura-pdf-mupdf" && sudo meson setup --reconfigure build && cd build && sudo ninja install)
    sudo pacman -R zathura
}

sunday-routine () {

    # Check internet connection
    if ! check-internet; then
        echo "No internet connection"
        return 1
    fi

    # Update dotfiles
    echo; echo "> Update dotfiles";echo
    dotfiles-sunday

    # Syncfiles
    echo; echo "> Syncfiles";echo
    syncfiles

    # Update system
    echo; echo "> Update system"; echo
    yay -Syu

    # Clean unused packages
    echo; echo "> Remove orphans"; echo
    sudo pacman -Rs $(pacman -Qtdq)
    paccache -rk 3

    # Recompile zathura
    echo; echo "> Recompile zathura"; echo
    recompile-zathura

    # Update neovim plugins
    echo; echo "> Update neovim plugins"; echo
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

    # Update nvim-treesitter
    echo; echo "> Update nvim-treesitter"; echo
    nvim --headless -c 'TSUpdate | q'

    # Clean reMarkable swapzone
    echo; echo "> Clean reMarkable swap folder"; echo
    rmrm
}
