#!/bin/bash

src="$HOME/Library/Preferences/"
dest="$HOME/.dotfiles/preferences/"

if [ "$1" == "restore" ]; then
  tmp="$dest"
  dest="$src"
  src="$tmp"
fi

files=(
  com.apple.universalaccess.plist
  com.googlecode.iterm2.plist
  com.apple.Preview.plist
  com.kodowa.LightTable.plist
  org.mozilla.firefox.plist
  com.sublimetext.3.plist
  com.apple.Safari.plist
)

for file in ${files[*]}; do
  cp "$src/$file" "$dest/$file"
done
