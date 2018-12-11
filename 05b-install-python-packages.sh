#!/bin/bash

modules=(
  black
  ipython
  jupyter
)

pip install "${modules[@]}"
