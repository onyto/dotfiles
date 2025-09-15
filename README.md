# Dotfiles

My personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Requirements

- stow - version 2.4.0 or newer

## Usage

Deploy with:

```stow -t $HOME --dotfiles --no-folding --verbose```

- ```-t $HOME``` → Target directory (your home folder)
- ```--dotfiles``` → Treat hidden files (those starting with a dot) as regular files
- ```--no‑folding``` → Prevent Stow from collapsing directories that contain a single item
- ```--verbose``` → Show detailed output so you can see what’s being linked.

Remove with:

```stow -D -t $HOME --dotfiles --no-folding```
