#!/bin/sh

echo "Setting defaults for code files to vscode"
code_as_default_text_editor() {
  set -- \
    ".c" \
    ".cpp" \
    ".js" \
    ".jsx" \
    ".ts" \
    ".tsx" \
    ".json" \
    ".md" \
    ".sql" \
    ".html" \
    ".css" \
    ".scss" \
    ".sass" \
    ".py" \
    ".sum" \
    ".rs" \
    ".go" \
    ".sh" \
    ".log" \
    ".toml" \
    ".yml" \
    ".yaml" \
    "public.plain-text" \
    "public.unix-executable" \
    "public.data"
  for ext in "${@}"; do
    duti -s com.microsoft.VSCode "${ext}" all
  done
}
code_as_default_text_editor


echo "Configuring Mac defaults"
# === Finder ===
# show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
# show status bar
defaults write com.apple.finder ShowStatusBar -bool true
# show path bar
defaults write com.apple.finder ShowPathbar -bool true
# when performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
# disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
# allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# === Dock ===
# don't show recently used applications in the Dock
defaults write com.apple.dock show-recents -bool false
# automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true
# move dock to right
defaults write com.apple.dock orientation -string "right"

# restarting apps:
echo "Restarting apps..."
killall Dock
killall Finder
