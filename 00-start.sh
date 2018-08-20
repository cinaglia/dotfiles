#!/bin/bash

set -x

DOTFILES_DIRECTORY=$(dirname $0)

# Execute scripts following the convention in sequence.
for s in $DOTFILES_DIRECTORY/0[1-9]*.sh; do
  bash $s
done
