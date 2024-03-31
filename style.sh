#!/bin/sh

# Fonts
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

# Themes
curl --output_dir ~ -fsSLO "https://raw.githubusercontent.com/catppuccin/sublime-text/main/Catppuccin%20Macchiato.sublime-color-scheme"
curl --output_dir ~ -fsSLO "https://raw.githubusercontent.com/catppuccin/iterm/main/colors/catppuccin-macchiato.itermcolors"
