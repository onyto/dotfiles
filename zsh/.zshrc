# .zshrc - for interactive shells only

# Docker completions
[[ -d $HOME/.docker/completions ]] && FPATH="$HOME/.docker/completions:$FPATH"

# Completion system
autoload -Uz compinit
compinit
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Z}' \
  'r:|[._-]=* r:|=*' \
  'l:|=* r:|=*'
zstyle ':completion:*' menu select

# Shell options
unsetopt beep
bindkey -e
setopt interactive_comments
autoload -U select-word-style
select-word-style bash

# History
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"
mkdir -p "${HISTFILE:h}"
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_dups
setopt hist_ignore_space

# Aliases
[[ -r ~/.aliasrc ]] && . ~/.aliasrc

# 'command not found' integration
[[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]] && . /usr/share/doc/pkgfile/command-not-found.zsh
[[ -r /etc/zsh_command_not_found ]] && . /etc/zsh_command_not_found

# zsh-autosuggestions
[[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && {
    ZSH_AUTOSUGGEST_STRATEGY=(completion)
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
}
[[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] && {
    ZSH_AUTOSUGGEST_STRATEGY=(completion)
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
}

# zsh-syntax-highlighting
[[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] && \
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# fzf integration
if [[ -d /usr/share/fzf ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    . /usr/share/fzf/key-bindings.zsh
    . /usr/share/fzf/completion.zsh
fi

if [[ -d /usr/share/doc/fzf ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
    . /usr/share/doc/fzf/examples/key-bindings.zsh
    . /usr/share/doc/fzf/examples/completion.zsh
fi

function sync_tmux_environment_with_shell() {
  if [ -n "${TMUX}" ]; then
    eval "$(tmux show-environment -s)"
  fi
}
add-zsh-hook precmd sync_tmux_environment_with_shell

# Starship prompt
if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh)"
fi
