#!/bin/sh

rm -f ~/.fzf.zsh ~/.gitconfig ~/.zprofile ~/.zshrc

for d in */ ; do
    stow --verbose --restow "${d}"
done
