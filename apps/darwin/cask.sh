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
  chromedriver
  docker
  firefox
  go
  google-backup-and-sync
  google-chrome
  google-cloud-sdk
  hammerspoon
  iterm2
  kap
  karabiner-elements
  keybase
  minikube
  ngrok
  notion
  postico
  sequel-pro
  sketch
  slack
  spotify
  telegram
  tunnelblick
  virtualbox
  visual-studio-code
  vlc
  whatsapp
  wifi-explorer
)

# Install all brew casks
for cask in "${casks[@]}"
do
  [ ! -d /usr/local/Caskroom/$(basename $cask) ] && brew cask install $cask || echo "Already installed: $cask"
done
