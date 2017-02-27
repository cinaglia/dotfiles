#!/bin/bash

DOTFILES=$HOME/dotfiles

# Glob dotfiles
shopt -s dotglob

function symlink_directory_files() {
  local origin=$1
  local dest=$2

  for f in $origin/*; do
    if [ ! -e $dest/$(basename $f) ]; then
      ln -nsf $f $dest
      echo "Symlinked $f."
    else
      echo "Symlink already existed: $f"
    fi
  done
}

# Create all symlinks
echo "Symlinking files from $DOTFILES/files/ into $HOME.."
symlink_directory_files $DOTFILES/files $HOME

# Create expected directories
DIRECTORIES=(workspace code bin)
echo "Creating directories.."
for directory in ${DIRECTORIES[@]}; do
  if [ ! -d $HOME/$directory ]; then
    mkdir -p $HOME/$directory
    echo "Created $HOME/$directory."
  else
    echo "Directory already existed: $directory"
  fi
done

# Symlink bin scripts
echo "Symlinking bin scripts from $DOTFILES/bin/ into $HOME/bin.."
symlink_directory_files $DOTFILES/bin $HOME/bin

# Source profile
echo "Sourcing $HOME/.bash_profile"
. $HOME/.bash_profile

# Install vim plugins
echo "Installing vim plugins.."
test -f $HOME/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
