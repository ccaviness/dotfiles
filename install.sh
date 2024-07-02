#!/bin/sh

echo "Install homebrew"
if ! brew --version ; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo "Install Homebrew formulae"
source brew.sh

echo "Install oh-my-zsh"
source omz.sh

echo "Install fonts and themes"
source style.sh

echo "Set up colors/themes"
source style.sh

# echo "Update symlinks"
echo "Set up symlinks using stow"
source symlinks.sh
# stow --restow .

echo "Reload .zshrc"
source ~/.zshrc
