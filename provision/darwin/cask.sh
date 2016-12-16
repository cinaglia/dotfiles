# Setup taps
brew tap | grep -q 'caskroom/versions' || brew tap caskroom/versions

casks=(
  bettertouchtool
  alfred
  dropbox
  1password
  sizeup
  totalspaces
  seil
  google-chrome
  google-drive
  chromecast
  spotify
  iterm2
  virtualbox
  vagrant
  hammerspoon
)

# Install all brew casks
for cask in "${casks[@]}"
do
  [ ! -d /opt/homebrew-cask/Caskroom/$(basename $cask) ] && brew cask install $cask
done
