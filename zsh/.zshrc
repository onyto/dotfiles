autoload -Uz compinit
compinit

zstyle :compinstall filename '~/.zshrc'
## case-insensitive (all) completion
#zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# Set case-insensitive,partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# General settings
unsetopt beep
bindkey -e
setopt interactive_comments
autoload -U select-word-style
select-word-style bash

# # Change Window Title
# autoload -Uz add-zsh-hook
#
# function xterm_title_precmd () {
#   print -Pn -- '\e]2;%n@%m %~\a'
#   [[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
# }
#
# function xterm_title_preexec () {
#   print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
#   [[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
# }
#
# if [[ "$TERM" == (Eterm*|alacritty*|aterm*|foot*|gnome*|konsole*|kterm*|putty*|rxvt*|screen*|wezterm*|tmux*|xterm*) ]]; then
#   add-zsh-hook -Uz precmd xterm_title_precmd
#   add-zsh-hook -Uz preexec xterm_title_preexec
# fi

# HISTCONTROL
HISTFILE=~/.cache/zsh/history
HISTSIZE=5000
SAVEHIST=5000
setopt hist_ignore_dups
setopt hist_ignore_space

# Aliases
if [[ -r ~/.aliasrc ]]; then
    . ~/.aliasrc
fi

# Use command not found, if available
# Arch
if [[ -r /usr/share/doc/pkgfile/command-not-found.zsh ]]; then
    . /usr/share/doc/pkgfile/command-not-found.zsh
fi
# Debian
if [[ -r /etc/zsh_command_not_found ]]; then
    . /etc/zsh_command_not_found
fi

# Use zsh-autosuggestions, if available
# Arch
if [[ -r /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    ZSH_AUTOSUGGEST_STRATEGY=(completion)
    . /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
# Debian
if [[ -r /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    ZSH_AUTOSUGGEST_STRATEGY=(completion)
    . /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Use zsh-syntax-highlighter, if available
# Arch
if [[ -r /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    . /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
# Debian
if [[ -r /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    . /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Use fzf keybinds and completion, if available
# Arch
if [[ -d /usr/share/fzf ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'

    . /usr/share/fzf/key-bindings.zsh
    . /usr/share/fzf/completion.zsh
fi
# Debian
if [[ -d /usr/share/doc/fzf ]]; then
    export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'

    . /usr/share/doc/fzf/examples/key-bindings.zsh
    . /usr/share/doc/fzf/examples/completion.zsh
fi

# Use nvm, if available
# Arch
if [[ -r /usr/share/nvm/nvm.sh ]]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    source /usr/share/nvm/nvm.sh
    source /usr/share/nvm/install-nvm-exec
fi
# Debian
if [[ -r ~/.nvm/nvm.sh ]]; then
    [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
    source ~/.nvm/nvm.sh
    # source ~/.nvm/install-nvm-exec
fi


# Starship Prompt
if [[ -x /usr/bin/starship ]] || [[ -x /usr/local/bin/starship ]]; then
    eval "$(starship init zsh)"
fi
