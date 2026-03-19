#!/bin/bash

echo "==============================================="
if [[ $XR_UP_WIVRN_HEADLESS ]]; then
  echo "      Updating WiVRn Server (no Dashboard)"
else
  echo "     Updating WiVRn Server (with Dashboard)"
fi
echo "==============================================="

cd wivrn
git fetch
if [[ $XR_UP_FORCE_BUILD || `git rev-list HEAD...origin/master --count` > 0 ]]; then
  git pull

  # build headless server
  if [[ $XR_UP_WIVRN_HEADLESS ]]; then
    cmake -B build-server . -GNinja -Wno-dev -DWIVRN_BUILD_CLIENT=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWIVRN_USE_PIPEWIRE=ON
    cmake --build build-server

  # build dashboard
  else
    cmake -B build-dashboard . -GNinja -Wno-dev -DWIVRN_BUILD_CLIENT=OFF -DWIVRN_BUILD_SERVER=ON -DWIVRN_BUILD_DASHBOARD=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWIVRN_USE_PIPEWIRE=ON
    cmake --build build-dashboard
  fi

else
  echo "Nothing to do."
fi
