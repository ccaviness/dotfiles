#!/bin/sh

echo "Setting up iTerm2 preferences..."
if [ -d "/Applications/iTerm.app" ]; then
  # Specify the preferences directory
  defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/.config/iterm2_settings"

  # Tell iTerm2 to use the custom preferences in the directory
  defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

  # Tell iTerm2 to save preferences automatically
  defaults write com.googlecode.iterm2.plist "NoSyncNeverRemindPrefsChangesLostForFile_selection" -int 2
fi


echo "Fetching fonts"
pushd ~/Library/Fonts
declare -a fonts=(
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
"https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
)

for font in "${fonts[@]}"; do
  curl -fSLO "${font}"
done

for f in *%20*; do
  mv "${f}" "${f//\%20/ }"
done

curl -fSLO https://github.com/arrowtype/recursive/releases/download/v1.085/ArrowType-Recursive-1.085.zip
unzip ArrowType-Recursive-1.085.zip
rm ArrowType-Recursive-1.085.zip
popd


echo "Fetching themes"
curl --output-dir ~ -fsSLO "https://raw.githubusercontent.com/catppuccin/sublime-text/main/Catppuccin%20Macchiato.sublime-color-scheme"
curl --output-dir ~ -fsSLO "https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-macchiato.itermcolors"
curl --output-dir .config/bat/themes -fsSLO "https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Macchiato.tmTheme"
