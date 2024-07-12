#!/bin/bash

current_version=""
if command -v hadolint> /dev/null; then
  current_version=v$(hadolint --version | awk '{printf $4}')
fi

latest_version=$(curl -sS -D - https://github.com/hadolint/hadolint/releases/latest -o /dev/null | awk -F / '/location/ {printf $8}')
# remove last character (ORS) that gets printed by awk
latest_version="${latest_version%?}"

if [[ "$current_version" != "$latest_version" ]]; then
  if [ -n "$current_version" ]; then
    rm ~/.local/bin/hadolint
    echo "Updating to HadoLint ${latest_version}..."
  else
    echo "Installing HadoLint ${latest_version}..."
  fi

  curl -O -L https://github.com/hadolint/hadolint/releases/download/${latest_version}/hadolint-Linux-x86_64
  chmod +x hadolint-Linux-x86_64
  mkdir -p ~/.local/bin
  mv hadolint-Linux-x86_64 ~/.local/bin/hadolint
  
  echo "Done"
else
  echo "[HadoLint] Already up to date!"
fi

