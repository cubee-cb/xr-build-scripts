#!/bin/bash

FEATURES="wayland,openxr,osc"

echo "==============================================="
echo "  Updating WayVR (release, $FEATURES)"
echo "==============================================="

cd wayvr-cubee
git fetch
if [[ `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  cargo build --release --no-default-features --features=$FEATURES
else
  echo "Nothing to do."
fi
