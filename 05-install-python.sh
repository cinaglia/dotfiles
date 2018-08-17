#!/bin/bash

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

maybe_install() {
  local query=$1
  [[ -z $query ]] && query=$DEFAULT_QUERY
  local latest_version=$(
    pyenv versions \
      | grep -E "^\s*$query" \
      | sed 's/^\s\+//' \
      | tail -1
  )

  if [[ -z $latest_version ]]; then
    pyenv install $(get_latest $query)
  else
    echo "Version $latest_version already installed."
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
