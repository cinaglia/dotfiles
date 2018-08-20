#!/bin/bash

. $HOME/.bash_profile
PYENV_ROOT="$(pyenv root)"
DEFAULT_QUERY="[0-9]"

get_latest() {
  local query=$1
  [[ -z $query ]] && query=$DEFAULT_QUERY
  pyenv install --list \
    | grep -vE "(^Available versions:|-src|dev|rc|alpha|beta|(a|b)[0-9]+)" \
    | grep -E "^\s*$query" \
    | sed 's/^\s\+//' \
    | tail -1
}

get_latest_installed() {
  local query=$1
  [[ -z $query ]] && query=$DEFAULT_QUERY
  pyenv versions --bare \
    | grep -E "^\s*$query" \
    | sed 's/^\s\+//' \
    | tail -1
}

maybe_install() {
  local latest_installed_version=$(get_latest_installed $1)

  if [[ -z $latest_installed_version ]]; then
    local version=$(get_latest $1)
    echo "Installing python $version."
    pyenv install $version
  else
    echo "Version $latest_installed_version already installed."
  fi
}

# Upgrade pyenv to latest
if [[ -n "$(command -v brew)" ]]; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade pyenv
else
  pushd $PYENV_ROOT && git pull && popd
fi

maybe_install 2
maybe_install 3

# Set global python version if not set
if [ "$(pyenv global)" = "system" ]; then
  version=$(get_latest_installed 3 | xargs)
  echo "Setting python ${version} as the default."
  pyenv global $version
fi
