# .zprofile - for login shells only

# Environment variables
export EDITOR="nvim"
export VISUAL="nvim --clean"
# export TERMINAL="xterm-256color"
# export BROWSER="/usr/bin/firefox"

# NVM
# Arch
if [[ -r /usr/share/nvm/nvm.sh ]]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    . /usr/share/nvm/nvm.sh
    . /usr/share/nvm/install-nvm-exec
fi

# Debian
if [[ -r ~/.nvm/nvm.sh ]]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    . ~/.nvm/nvm.sh
    # . ~/.nvm/install-nvm-exec
fi
