#!/bin/bash

echo "==============================================="
if [[ $XR_UP_WAYVR_FEATURES ]]; then
  echo "  Updating WayVR (release, $XR_UP_WAYVR_FEATURES)"
else
  echo "           Updating WayVR (release)"
fi
echo "==============================================="

cd wayvr
git fetch
if [[ $XR_UP_BUILD_ALL || `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  if [[ $XR_UP_WAYVR_FEATURES ]]; then
    cargo build --release --no-default-features --features=$XR_UP_WAYVR_FEATURES
  else
    cargo build --release
  fi
else
  echo "Nothing to do."
fi
