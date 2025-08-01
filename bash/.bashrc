# ~/.bashrc - for interactive shells

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# XDG Base Directory Specification
export XDG_DESKTOP_DIR="$HOME/"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Aliases
[[ -r ~/.aliasrc ]] && . ~/.aliasrc

# History
#HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/bash/history"
#mkdir -p "$(dirname "$HISTFILE")"
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:ignorespace
shopt -s histappend

# Bash completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Docker completions
[[ -d $HOME/.docker/completions ]] && complete -o default -F _docker docker

# 'command not found' integration
[[ -r /usr/share/doc/pkgfile/command-not-found.bash ]] && . /usr/share/doc/pkgfile/command-not-found.bash
[[ -r /etc/bash_command_not_found ]] && . /etc/bash_command_not_found

# fzf integration
if [[ -d /usr/share/fzf ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    . /usr/share/fzf/key-bindings.bash
    . /usr/share/fzf/completion.bash
elif [[ -d /usr/share/doc/fzf ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    . /usr/share/doc/fzf/examples/key-bindings.bash
    . /usr/share/doc/fzf/examples/completion.bash
fi

# Synchronize tmux environment variables with the shell
function prompt_command() {
  if [ -n "${TMUX}" ]; then
    eval "$(tmux show-environment -s)"
  fi
}
PROMPT_COMMAND=prompt_command

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init bash)"
fi

