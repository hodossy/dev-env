#!/bin/bash

nvim_file_basename="nvim-linux-x86_64"
current_version=""
if command -v nvim &> /dev/null; then
  current_version=$(nvim --version | awk '/NVIM/ {printf $2}')
fi

latest_version=$(curl -sS -D - https://github.com/neovim/neovim/releases/latest -o /dev/null | awk -F / '/location/ {printf $8}')
# remove last character (ORS) that gets printed by awk
latest_version="${latest_version%?}"

if [[ "$current_version" != "$latest_version" ]]; then
  if [ -n "$current_version" ]; then
    rm -R ~/.local/bin/nvim-*
    echo "Updating to NVIM ${latest_version}..."
  else
    echo "Installing NVIM ${latest_version}..."
  fi

  curl -O -L https://github.com/neovim/neovim/releases/download/${latest_version}/${nvim_file_basename}.tar.gz
  tar xzvf ${nvim_file_basename}.tar.gz > /dev/null
  mkdir -p ~/.local/bin
  mv ${nvim_file_basename}/ ~/.local/bin/
  rm ${nvim_file_basename}.tar.gz

  echo "Done"
else
  echo "[NeoVIM] Already up to date!"
fi

if ! command -v nvim &> /dev/null; then
  export PATH="$PATH:$HOME/.local/bin/${nvim_file_basename}/bin"
  echo "export PATH=\"$PATH:$HOME/.local/bin/${nvim_file_basename}/bin\"" | tee -a ~/.bashrc > /dev/null
fi

if [ ! -d ~/.config/nvim ]; then
  echo "Configuring nvim..."
  mkdir -p ~/.config
  ln -s `pwd`/nvim ~/.config/nvim
fi

