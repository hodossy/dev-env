#!/bin/bash

echo "Set up nvim..."

if [ ! -d ~/.config/nvim ]; then
  ln -s `pwd`/nvim ~/.config/nvim
fi
