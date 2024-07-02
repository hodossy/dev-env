#!/bin/bash

set -e  # exit on error

for f in scripts/setup_*.sh scripts/**/setup_*.sh; do
  if [[ ! "$f" =~ "*" ]]; then
    bash "$f"
  fi
done
