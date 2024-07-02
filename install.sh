#!/bin/sh

echo "Setting up Mac..."
mkdir -p "${HOME}/.config"

echo "Installing Xcode command line utils"
xcode-select --install
# sudo xcodebuild -license accept

echo "Install homebrew"
if ! brew --version ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh || true)"
    # shellcheck disable=SC2016
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "${HOME}"/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv || true)"
fi

echo "Install Homebrew formulae"
. brew.sh

echo "Install oh-my-zsh"
. omz.sh

echo "Set up colors/themes"
. style.sh

echo "Setting up defaults"
. defaults.sh

echo "Set up symlinks using stow"
. symlinks.sh

if [ -n "${ZSH_VERSION}" ]; then
    echo "Reload .zshrc"
    # shellcheck source=./zsh/.zshrc
    . ~/.zshrc
fi
