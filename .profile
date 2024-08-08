# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.

# Source the universal shell setup file - sets up common environment variables
# I need to do this now to ensure that, no matter what, these environment
# variables are loaded before a desktop environment/window manager lauches
# This makes the DE/WM process have those environment variables, which
# is important when ensuring a constant GTK theme, something I found out by
# testing with Linux Mint on my desktop.
. ~/.shrc

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi




