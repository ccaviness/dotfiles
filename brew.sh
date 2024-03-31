#!/bin/sh

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Update and upgrade already-installed formulae
brew update
brew upgrade

# Add taps
brew tap blacktop/tap

# Install binaries
brew install bat
brew install diff-so-fancy
brew install git
brew install pstree
brew install qemu
brew install stow
brew install tldr
brew install tree
brew install jq
brew install python
brew install pylint
brew install mypy
brew install zsh-syntax-highlighting

# Install casks
brew install --cask alt-tab
brew install --cask git-credential-manager
brew install --cask hiddenbar
brew install --cask iterm2
brew install --cask raycast
brew install --cask stats

# Install fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# Install oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Remove outdated versions from the cellar
brew cleanup
