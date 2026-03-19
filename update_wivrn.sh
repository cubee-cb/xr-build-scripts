#!/bin/bash

echo "==============================================="
echo "     Updating WiVRn Server (with Dashboard)"
echo "==============================================="

cd wivrn
git fetch
if [[ $XR_UP_BUILD_ALL || `git rev-list HEAD...origin/master --count` > 0 ]]; then
  git pull
  cmake -B build-dashboard . -GNinja -Wno-dev -DWIVRN_BUILD_CLIENT=OFF -DWIVRN_BUILD_SERVER=ON -DWIVRN_BUILD_DASHBOARD=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWIVRN_USE_PIPEWIRE=ON
  cmake --build build-dashboard
else
  echo "Nothing to do."
fi
