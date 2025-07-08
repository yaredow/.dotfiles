#!/bin/bash

git clone --bare git@github.com:yaredow/dotfiles.git $HOME/.dotfiles

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

mkdir -p .dotfiles-backup
dotfiles checkout || {
    echo "Backing up pre-existing dotfiles"
    dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/
}

dotfiles checkout
dotfiles config --local status.showUntrackedFiles no

