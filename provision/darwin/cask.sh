# Setup taps
brew tap | grep -q 'caskroom/versions' || brew tap caskroom/versions

casks=(
  # (Un)Productivity
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

  # Development
  sublime-text3
  iterm2
  virtualbox
  vagrant
)

# Install all brew casks
for cask in "${casks[@]}"
do
  [ ! -d /opt/homebrew-cask/Caskroom/$(basename $cask) ] && brew cask install $cask
done
