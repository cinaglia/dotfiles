#!/bin/bash

# Update apt-get
sudo apt-get update
sudo apt-get upgrade -y

pkgs=(
  build-essential
  curl
  git
  libbz2-dev
  libffi-dev
  liblzma-dev
  libncurses5-dev
  libncursesw5-dev
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  llvm
  make
  software-properties-common
  tk-dev
  vim
  wget
  xz-utils
  zlib1g-dev
  jq
  tmux
)

# Install packages
sudo apt-get -y install "${pkgs[@]}"

# Install pyenv
if [ ! -n "$(command -v pyenv)" ]; then
  curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
fi

# Instal nodenv
if [ ! -n "$(command -v nodenv)" ]; then
  git clone https://github.com/nodenv/nodenv.git ~/.nodenv
  git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
  pushd ~/.nodenv
    src/configure && make -C src
  popd
fi

# Install z
wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh

# Install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --no-update-rc

# Install vcprompt
if [ ! -f /usr/local/bin/vcprompt ]; then
   wget -O /tmp/vcprompt.tar.gz https://bitbucket.org/gward/vcprompt/downloads/vcprompt-1.2.1.tar.gz
   cd /tmp && tar -xzf vcprompt.tar.gz
   cd /tmp/vcprompt-* && ./configure && make
   sudo cp /tmp/vcprompt-*/vcprompt /usr/local/bin/
   rm -rf /tmp/vcprompt*
fi
