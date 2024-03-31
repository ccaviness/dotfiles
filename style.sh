#!/bin/sh

# Fonts
pushd ~/Library/Fonts
declare -a fonts=(
'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Regular.ttf'
'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold.ttf'
'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Italic.ttf'
'https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS NF Bold Italic.ttf'
)

for font in "${fonts[@]}"; do
  curl -LO "${font}"
done

for f in *%20*; do echo ${f//\%20/ }; done

curl -LO https://github.com/arrowtype/recursive/releases/download/v1.085/ArrowType-Recursive-1.085.zip
unzip ArrowType-Recursive-1.085.zip
rm ArrowType-Recursive-1.085.zip

popd

# Themes
https://raw.githubusercontent.com/catppuccin/sublime-text/main/Catppuccin%20Macchiato.sublime-color-scheme