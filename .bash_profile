#
# ~/.bash_profile
#

# Bashrc
[[ -f ~/.bashrc ]] && . ~/.bashrc

# Environment variables
export DOWNLOADS="~/Downloads"

# PATH
PATH=$PATH:"~/.local/bin"

# Start GUI
if [[ "$(tty)" = "/dev/tty1" ]]; then
	pgrep i3 || startx
fi
