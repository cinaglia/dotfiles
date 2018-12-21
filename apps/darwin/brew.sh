#!/bin/bash

# Install homebrew
[ ! -f /usr/local/bin/brew ] && ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap | grep -q 'universal-ctags' || brew tap universal-ctags/universal-ctags

pkgs=(
  "universal-ctags --HEAD"
  awscli
  bash-completion
  colordiff
  fzf
  git
  git-flow
  go
  gpg
  highlight
  httpie
  hub
  jq
  jsonnet
  mackup
  mercurial
  mysql-client
  node
  nodenv
  pstree
  pyenv
  pyenv-virtualenv
  rbenv
  reattach-to-user-namespace
  redis
  ruby
  ssh-copy-id
  terraform
  the_silver_searcher
  tig
  tmux
  tree
  unrar
  vcprompt
  vim
  z
)

# Install all brew packages
for pkg in "${pkgs[@]}"
do
  [ ! -d /usr/local/Cellar/$(basename $pkg) ] && brew install $pkg || echo "Already installed: $pkg"
done
