#!/bin/bash

echo "==============================================="
echo "           Updating WayVR (release)"
echo "==============================================="

cd wayvr
git fetch
if [[ `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  cargo build --release
else
  echo "Nothing to do."
fi
