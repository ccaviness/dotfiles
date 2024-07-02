#!/bin/sh

echo "Setting up iTerm2 preferences..."
if [ -d "/Applications/iTerm.app" ]; then
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "${HOME}/.config/iterm2_settings"

  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

  # Tell iTerm2 to save preferences automatically
  defaults write com.googlecode.iterm2.plist "NoSyncNeverRemindPrefsChangesLostForFile_selection" -int 2
fi

echo "Fetching themes"
curl --output-dir ~ -fsSLO "https://raw.githubusercontent.com/catppuccin/sublime-text/main/Catppuccin%20Macchiato.sublime-color-scheme"
curl --output-dir ~ -fsSLO "https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-macchiato.itermcolors"
curl --output-dir .config/bat/themes -fsSLO "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Macchiato.tmTheme"
