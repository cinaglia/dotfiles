# Setup cask taps
brew tap | grep -q 'caskroom/cask' || brew tap caskroom/cask
brew tap | grep -q 'caskroom/versions' || brew tap caskroom/versions
brew tap | grep -q 'caskroom/drivers' || brew tap caskroom/drivers

casks=(
  bettertouchtool
  alfred
  dropbox
  1password
  sizeup
  google-chrome
  google-drive
  spotify
  iterm2
  virtualbox
  vagrant
  hammerspoon
  logitech-gaming-software
)

# Install all brew casks
for cask in "${casks[@]}"
do
  [ ! -d /usr/local/Caskroom/$(basename $cask) ] && brew cask install $cask || echo "Already installed: $cask"
done
