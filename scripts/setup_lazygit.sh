#!/bin/bash

current_version=""
if command -v lazygit> /dev/null; then
  current_version=v$(lazygit --version | awk -F '[,=]' '{printf $8}')
fi

latest_version=$(curl -sS -D - https://github.com/jesseduffield/lazygit/releases/latest -o /dev/null | awk -F / '/location/ {printf $8}')
# remove last character (ORS) that gets printed by awk
latest_version="${latest_version%?}"

if [[ "$current_version" != "$latest_version" ]]; then
  if [ -n "$current_version" ]; then
    rm ~/.local/bin/lazygit
    echo "Updating to LazyGit ${latest_version}..."
  else
    echo "Installing LazyGit ${latest_version}..."
  fi

  curl -O -L https://github.com/jesseduffield/lazygit/releases/download/${latest_version}/lazygit_${latest_version:1}_Linux_x86_64.tar.gz
  mkdir lazygit_${latest_version}
  tar xzvf lazygit_${latest_version:1}_Linux_x86_64.tar.gz --directory lazygit_${latest_version} > /dev/null
  mkdir -p ~/.local/bin
  mv lazygit_${latest_version}/lazygit ~/.local/bin
  rm -R lazygit_*

  echo "Done"
else
  echo "Already up to date!"
fi

if [ ! -d ~/.config/lazygit ]; then
  echo "Configuring LazyGit..."
  ln -s `pwd`/lazygit ~/.config/lazygit
fi

