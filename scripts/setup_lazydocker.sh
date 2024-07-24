#!/bin/bash

current_version=""
if command -v lazydocker > /dev/null; then
  current_version=v$(lazydocker --version | awk -F '[,=]' '{printf $8}')
fi

latest_version=$(curl -sS -D - https://github.com/jesseduffield/lazydocker/releases/latest -o /dev/null | awk -F / '/location/ {printf $8}')
# remove last character (ORS) that gets printed by awk
latest_version="${latest_version%?}"

if [[ "$current_version" != "$latest_version" ]]; then
  if [ -n "$current_version" ]; then
    rm ~/.local/bin/lazydocker
    echo "Updating to LazyDocker ${latest_version}..."
  else
    echo "Installing LazyDocker ${latest_version}..."
  fi

  curl -O -L https://github.com/jesseduffield/lazydocker/releases/download/${latest_version}/lazydocker_${latest_version:1}_Linux_x86_64.tar.gz
  mkdir lazydocker_${latest_version}
  tar xzvf lazydocker_${latest_version:1}_Linux_x86_64.tar.gz --directory lazydocker_${latest_version} > /dev/null
  mkdir -p ~/.local/bin
  mv lazydocker_${latest_version}/lazydocker ~/.local/bin
  rm -R lazydocker_*

  echo "Done"
else
  echo "[LazyDocker] Already up to date!"
fi

if [ ! -d ~/.config/lazydocker ]; then
  echo "Configuring LazyDocker..."
  ln -s `pwd`/lazydocker ~/.config/lazydocker
fi

