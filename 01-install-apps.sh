#!/bin/bash

OS=`uname -s | tr '[:upper:]' '[:lower:]'`
APPS_DIRECTORY=$HOME/dotfiles/apps/

# Install OS-specific applications
for t in $APPS_DIRECTORY/$OS/*; do
  bash $t
done
