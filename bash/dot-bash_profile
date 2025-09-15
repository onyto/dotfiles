# ~/.bash_profile - for login shells

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim --clean"
export PAGER="less"
# export TERMINAL="xterm-256color"
# export BROWSER="/usr/bin/firefox"

# NVM - Arch-based
if [[ -r /usr/share/nvm/nvm.sh ]]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    . /usr/share/nvm/nvm.sh
    . /usr/share/nvm/install-nvm-exec
fi

# NVM - Debian-based
if [[ -r ~/.nvm/nvm.sh ]]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    . ~/.nvm/nvm.sh
    # . ~/.nvm/install-nvm-exec
fi

