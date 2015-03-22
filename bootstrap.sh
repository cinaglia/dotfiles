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
test -d $HOME/.vim/bundle/vundle || git clone https://github.com/gmarik/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
