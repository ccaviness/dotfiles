#!/bin/sh

echo "Fetching oh-my-zsh"
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Install omz plugins"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions.git ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

echo "Install p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

echo "Configure fzf"
$(brew --prefix)/opt/fzf/install

echo "Install fzt-git.sh"
git clone https://github.com/junegunn/fzf-git.sh.git ~/.fzf-git.sh
