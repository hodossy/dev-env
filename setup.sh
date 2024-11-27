#!/bin/bash

set -e  # exit on error

if [[ $# -ne 0 ]]; then
  for tool in $@; do
    for f in scripts/setup_$tool.sh; do
      if [[ ! "$f" =~ "*" ]]; then
        bash "$f"
      fi
    done
  done
  for tool in $@; do
    for f in scripts/**/setup_$tool.sh; do
      if [[ ! "$f" =~ "*" ]]; then
        bash "$f"
      fi
    done
  done
else
  for f in scripts/setup_*.sh scripts/**/setup_*.sh; do
    if [[ ! "$f" =~ "*" ]]; then
      bash "$f"
    fi
  done
fi
