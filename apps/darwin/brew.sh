# Install homebrew
[ ! -f /usr/local/bin/brew ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap | grep -q 'universal-ctags' || brew tap universal-ctags/universal-ctags

pkgs=(
  "universal-ctags --HEAD"
  bash-completion
  colordiff
  fzf
  git
  git-flow
  highlight
  httpie
  hub
  jq
  macvim
  mercurial
  node
  nodenv
  pyenv
  pyenv-virtualenv
  rbenv
  reattach-to-user-namespace
  ruby
  ssh-copy-id
  the_silver_searcher
  tig
  tmux
  tree
  unrar
  vcprompt
  z
)

# Install all brew packages
for pkg in "${pkgs[@]}"
do
  [ ! -d /usr/local/Cellar/$(basename $pkg) ] && brew install $pkg || echo "Already installed: $pkg"
done
