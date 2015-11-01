#!/bin/bash

DOTFILES=$HOME/dotfiles

# Glob dotfiles
shopt -s dotglob

# Create all symlinks
echo "Symlinking files from $DOTFILES/files/ into $HOME.."
for f in $DOTFILES/files/*; do
    if [ ! -e $HOME/$(basename $f) ]; then
        ln -nsf $f $HOME
        echo "Symlinked $f."
    fi
done

# Create expected directories
DIRECTORIES=(workspace code bin .vim/bundle)
echo "Creating directories.."
for directory in ${DIRECTORIES[@]}; do
    if [ ! -d $HOME/$directory ]; then
        mkdir -p $HOME/$directory
        echo "Created $HOME/$directory."
    fi
done

# Source profile
echo "Sourcing $HOME/.bash_profile"
. $HOME/.bash_profile

# Install vim plugins
echo "Installing vim plugins.."
test -f $HOME/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
