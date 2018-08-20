#!/bin/bash

# Make apt noninteractive
export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

# Update apt-get
apt-get update
apt-get upgrade -y

pkgs=(
  build-essential
  curl
  git
  jq
  libbz2-dev
  libffi-dev
  liblzma-dev
  libncurses5-dev
  libncursesw5-dev
  libreadline-dev
  libsqlite3-dev
  libssl-dev
  llvm
  locales
  make
  software-properties-common
  tk-dev
  tmux
  vim
  wget
  xz-utils
  zlib1g-dev
)

# Install packages
apt-get -y install "${pkgs[@]}"

# Generate locale
locale-gen "en_US.UTF-8"
update-locale LC_ALL="en_US.UTF-8"

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
if [ ! -z ~/.fzf ]; then
  wget https://raw.githubusercontent.com/rupa/z/master/z.sh -O ~/z.sh
fi

# Install fzf
if [ ! -z ~/.fzf ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --key-bindings --completion --no-update-rc
fi

# Install vcprompt
if [ ! -f /usr/local/bin/vcprompt ]; then
   wget -O /tmp/vcprompt.tar.gz https://bitbucket.org/gward/vcprompt/downloads/vcprompt-1.2.1.tar.gz
   cd /tmp && tar -xzf vcprompt.tar.gz
   cd /tmp/vcprompt-* && ./configure && make
   cp /tmp/vcprompt-*/vcprompt /usr/local/bin/
   rm -rf /tmp/vcprompt*
fi
