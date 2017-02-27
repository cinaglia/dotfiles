# Install homebrew
[ ! -f /usr/local/bin/brew ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

pkgs=(
  pyenv
  pyenv-virtualenv
  nodenv
  ruby
  git
  git-flow
  mercurial
  tmux
  tree
  unrar
  colordiff
  z
  bash-completion
  jq
  the_silver_searcher
  ssh-copy-id
  vcprompt
  httpie
  fzf
  highlight
  ctags
  reattach-to-user-namespace
  macvim
  hub
  tig
)

# Install all brew packages
for pkg in "${pkgs[@]}"
do
  [ ! -d /usr/local/Cellar/$(basename $pkg) ] && brew install $pkg || echo "Already installed: $pkg"
done
