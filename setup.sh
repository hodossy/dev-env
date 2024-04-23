#!/bin/bash

set -e  # exit on error

for f in scripts/*.sh; do
  bash "$f"
done
