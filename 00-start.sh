#!/bin/bash

set -ex

DOTFILES_DIRECTORY=$(dirname $0)

# Execute scripts following the convention in sequence.
for s in $DOTFILES_DIRECTORY/0[1-9]*.sh; do
  . $s
done
