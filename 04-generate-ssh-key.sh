#!/bin/bash

if [ ! -f $HOME/.ssh/id_rsa ]; then
  ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''
fi
