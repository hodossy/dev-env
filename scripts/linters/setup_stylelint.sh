#!/bin/bash

if command -v stylelint > /dev/null; then
  if npm outdated -g | grep stylelint; then
    echo "Updating stylelint"
    npm install stylelint@latest > /dev/null

    echo "Done"
  else
    echo "[StyleLint] Already up to date!"
  fi
else
  echo "Installing StyleLint"
  npm install -g stylelint > /dev/null
  echo "Done"
fi

