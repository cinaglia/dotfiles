# Install homebrew
[ ! -f /usr/local/bin/brew ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

pkgs=(
  # Environments
  python
  python3

  # Development
  ruby
  node
  git
  git-flow
  mercurial
  reattach-to-user-namespace
  tmux
  tree
  unrar
  colordiff
  z
  bash-completion
  jq
  the_silver_searcher
  grep
  ssh-copy-id
  pyenv-virtualenv
  pygmentize
  vcprompt
  caskroom/cask/brew-cask
)

# Install all brew packages
for pkg in "${pkgs[@]}"
do
  [ ! -f /usr/local/bin/$pkg ] && brew install $pkg
done