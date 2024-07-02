#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Update and upgrade already-installed formulae"
brew update
brew upgrade

echo "Add taps"
brew tap blacktop/tap

echo "Install binaries"
brew install bat
brew install diff-so-fancy
brew install eza
brew install fd
brew install finicky
brew install fzf
brew install git
brew install git-delta
brew install jq
brew install mypy
brew install pstree
brew install pylint
brew install python
brew install qemu
brew install stow
brew install tldr
brew install tree
brew install zsh-syntax-highlighting

echo "Install casks"
brew install --cask alt-tab
brew install --cask iterm2
brew install --cask stats
brew install --cask whisky
brew install --cask git-credential-manager
brew install --cask raycast
brew install --cask steamcmd
brew install --cask wineskin
brew install --cask hiddenbar
brew install --cask secretive
brew install --cask suspicious-package

# Remove outdated versions from the cellar
brew cleanup
