#!/bin/bash

export XR_UP_WAYVR_FEATURES="wayland,openxr,osc,pipewire"
TARGET_FOLDER=/opt/wayvr

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
  sudo install -CDt $TARGET_FOLDER target/release/{uidev,wayvr,wayvrctl}
  sudo install -CDt $TARGET_FOLDER wayvr/wayvr.png
  echo "Installed to \"$TARGET_FOLDER\" <- This is where the WayVR executables are."
else
  echo "Nothing to do."
fi
