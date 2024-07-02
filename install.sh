#!/bin/sh

echo "Setting up Mac..."
mkdir -p "$HOME/.config"

echo "Install homebrew"
if ! brew --version ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Install Homebrew formulae"
source brew.sh

echo "Install oh-my-zsh"
source omz.sh

echo "Set up colors/themes"
source style.sh

# echo "Update symlinks"
echo "Set up symlinks using stow"
source symlinks.sh

echo "Reload .zshrc"
source ~/.zshrc
