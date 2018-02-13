# Setup cask taps
brew tap | grep -q 'caskroom/cask' || brew tap caskroom/cask
brew tap | grep -q 'caskroom/versions' || brew tap caskroom/versions
brew tap | grep -q 'caskroom/drivers' || brew tap caskroom/drivers

casks=(
  1password
  alfred
  bettertouchtool
  docker
  google-backup-and-sync
  google-chrome
  hammerspoon
  iterm2
  sketch
  slack
  spotify
  virtualbox
)

# Install all brew casks
for cask in "${casks[@]}"
do
  [ ! -d /usr/local/Caskroom/$(basename $cask) ] && brew cask install $cask || echo "Already installed: $cask"
done
