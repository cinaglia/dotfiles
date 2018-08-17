#!/bin/bash

# Install vim plugins
echo "Installing vim plugins.."
test -f $HOME/.vim/autoload/plug.vim || curl -fLo ~/.vim/autoload/plug.vim \
  --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
