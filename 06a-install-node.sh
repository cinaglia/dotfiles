#!/bin/bash

NODENV_ROOT="$(nodenv root)"
DEFAULT_QUERY="[0-9]"

get_latest() {
  local query=$1
  [[ -z $query ]] && query=$DEFAULT_QUERY
  nodenv install --list \
    | grep -vE "(^Available versions:|-src|dev|rc|alpha|beta|(a|b)[0-9]+)" \
    | grep -E "^\s*$query" \
    | sed 's/^\s\+//' \
    | tail -1
}

get_latest_installed() {
  local query=$1
  [[ -z $query ]] && query=$DEFAULT_QUERY
  nodenv versions --bare \
    | grep -E "^\s*$query" \
    | sed 's/^\s\+//' \
    | tail -1
}

maybe_install() {
  local latest_installed_version=$(get_latest_installed $1)

  if [[ -z $latest_installed_version ]]; then
    local version=$(get_latest $1)
    echo "Installing node $version."
    nodenv install $version
  else
    echo "Version $latest_installed_version already installed."
  fi
}

# Upgrade nodenv to latest
if [[ -n "$(command -v brew)" ]]; then
  HOMEBREW_NO_AUTO_UPDATE=1 brew upgrade nodenv
else
  pushd $NODENV_ROOT && git pull && popd
fi

# Install latest node 9.x
maybe_install 9

# Install latest node 10.x
maybe_install 10

# Set global node version if not set
if [ "$(nodenv global)" = "system" ]; then
  version=$(get_latest_installed 10 | xargs)
  echo "Setting node ${version} as the default."
  nodenv global $version
fi
