#!/bin/sh

# Install homebrew
if ! brew --version ; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Homebrew formulae
source brew.sh

# Install oh-my-zsh
source omz.sh

# Install fonts and themes
source style.sh

# Set up symlinks using stow
source symlinks.sh

# # Set up colors/themes
source style.sh

echo "Update symlinks"
stow --restow .

echo "Reload .zshrc"
source ~/.zshrc
