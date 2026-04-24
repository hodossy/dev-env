#!/bin/bash

set -e  # exit on error

error() {
  echo "$@" >&2
  exit 1
}

# Install Mise
os="$(uname -s)"
if [ "$os" = Linux ]; then
  gpg --keyserver hkps://keys.openpgp.org --recv-keys 24853EC9F655CE80B48E6C3A8B81C9D17413A06D
  curl https://mise.jdx.dev/install.sh.sig | gpg --decrypt | sh
else
  error "unsupported OS: $os"
fi

# Configure all tools at once
if [ ! -d ~/.config ]; then
  ln -s `pwd`/config ~/.config
else
  error "$HOME/.config already exists, skipping tool configuration"
fi
