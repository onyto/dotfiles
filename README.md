# dotfiles
My dotfiles

use stow -t $HOME for user dots and -t /etc for global dots

use stow --no-folding for linking files instead of the full dir (useful for linking only the tmux.conf if there also exists a plugins folder within tmux)

use stow --dotfiles once it's fixed in v.2.4.0
