#!/bin/bash

export XR_UP_WAYVR_FEATURES="wayland,openxr,osc,pipewire"

echo "==============================================="
if [[ $XR_UP_WAYVR_FEATURES ]]; then
  echo "  Updating WayVR (release, $XR_UP_WAYVR_FEATURES)"
else
  echo "           Updating WayVR (release)"
fi
echo "==============================================="

cd wayvr
git fetch
if [[ $XR_UP_FORCE_BUILD || `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  if [[ $XR_UP_WAYVR_FEATURES ]]; then
    cargo build --release --no-default-features --features=$XR_UP_WAYVR_FEATURES
  else
    cargo build --release
  fi
else
  echo "Nothing to do."
fi
