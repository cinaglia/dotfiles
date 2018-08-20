#!/bin/bash

. $HOME/.bash_profile
modules=(
  black
)

pip install "${modules[@]}"
