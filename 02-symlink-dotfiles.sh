#!/bin/bash

DOTFILES=$HOME/dotfiles
DIRECTORIES=(workspace bin)

# Glob dotfiles
shopt -s dotglob

function symlink_directory_files() {
  local origin=$1
  local dest=$2
  local prefix=$3

  for f in $origin/*; do
    local fname="$dest/$prefix$(basename $f)"
    if [ ! -e $fname ]; then
      ln -nsf $f $fname
      echo "Symlinked $f."
    else
      echo "Symlink already exists: $f"
    fi
  done
}

# Create all symlinks
echo "Symlinking files from $DOTFILES/files/ into $HOME.."
symlink_directory_files $DOTFILES/files $HOME "."

# Create expected directories
echo "Creating directories.."
for directory in ${DIRECTORIES[@]}; do
  if [ ! -d $HOME/$directory ]; then
    mkdir -p $HOME/$directory
    echo "Created $HOME/$directory."
  else
    echo "Directory already exists: $directory"
  fi
done

# Symlink bin scripts
echo "Symlinking bin scripts from $DOTFILES/bin/ into $HOME/bin.."
symlink_directory_files $DOTFILES/bin $HOME/bin

# Source profile
echo "Sourcing $HOME/.bash_profile"
. $HOME/.bash_profile
