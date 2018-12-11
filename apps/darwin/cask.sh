#!/bin/bash

# Setup cask taps
brew tap | grep -q 'caskroom/cask' || brew tap caskroom/cask
brew tap | grep -q 'caskroom/versions' || brew tap caskroom/versions
brew tap | grep -q 'caskroom/drivers' || brew tap caskroom/drivers

casks=(
  1password
  1password-cli
  alfred
  bettertouchtool
  docker
  firefox
  google-backup-and-sync
  google-chrome
  google-cloud-sdk
  hammerspoon
  iterm2
  kap
  karabiner-elements
  keybase
  notion
  postico
  sketch
  slack
  spotify
  telegram
  virtualbox
  visual-studio-code
  vlc
  whatsapp
)

# Install all brew casks
for cask in "${casks[@]}"
do
  [ ! -d /usr/local/Caskroom/$(basename $cask) ] && brew cask install $cask || echo "Already installed: $cask"
done
