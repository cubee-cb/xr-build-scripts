#!/bin/bash

echo "==============================================="
echo "      Updating WiVRn Server (no Dashboard)"
echo "==============================================="

cd wivrn
git fetch
if [[ $XR_UP_BUILD_ALL || `git rev-list HEAD...origin/master --count` > 0 ]]; then
  git pull
  cmake -B build-server . -GNinja -Wno-dev -DWIVRN_BUILD_CLIENT=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWIVRN_USE_PIPEWIRE=ON
  cmake --build build-server
  if [[ $XR_UP_USE_SYSTEMD ]]; then
    systemctl restart --user wivrn-git
  fi
else
  echo "Nothing to do."
fi
