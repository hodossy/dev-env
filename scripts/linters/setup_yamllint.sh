#!/bin/bash

if command -v yamllint > /dev/null; then
  if pip list -o | grep yamllint; then
    echo "Updating yamllint"
    pip install yamllint -U > /dev/null

    echo "Done"
  else
    echo "[YAML Lint] Already up to date!"
  fi
else
  echo "Installing YAML Lint"
  pip install yamllint > /dev/null
  echo "Done"
fi

