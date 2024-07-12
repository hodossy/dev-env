#!/bin/bash

if command -v eslint > /dev/null; then
  if npm outdated -g | grep eslint; then
    echo "Updating eslint"
    npm install eslint@latest > /dev/null

    echo "Done"
  else
    echo "[Eslint] Already up to date!"
  fi
else
  npm install -g eslint > /dev/null
fi

