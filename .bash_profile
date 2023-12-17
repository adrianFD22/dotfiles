#
# ~/.bash_profile
#

# Bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Environment variables
export DOWNLOADS="~/Downloads"
#export QUTE_QT_WRAPPER=PyQt5   # Use Qt5 instead of Qt6

# PATH
#PATH=$PATH:"/home/adrian/.local/bin"
PATH=$PATH:"/home/adrian/.local/bin/scripts"
PATH=$PATH:"/home/adrian/.elan/bin"

export PATH

# Start GUI
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
