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
# shellcheck source=brew.sh
. brew.sh

echo "Install oh-my-zsh"
# shellcheck source=omz.sh
. omz.sh

echo "Set up colors/themes"
# shellcheck source=style.sh
. style.sh

echo "Setting up defaults"
# shellcheck source=defaults.sh
. defaults.sh

echo "Set up symlinks using stow"
# shellcheck source=symlinks.sh
. symlinks.sh

if [ -n "${ZSH_VERSION}" ]; then
    echo "Reload .zshrc"
    # shellcheck source=zsh/.zshrc
    . "${HOME}"/.zshrc
fi
