#!/bin/bash

echo "==============================================="
echo "      Updating WiVRn Server (no Dashboard)"
echo "==============================================="

cd wivrn
systemctl stop --user wivrn-git
git fetch
if [[ `git rev-list HEAD...origin/master --count` > 0 ]]; then
  git pull
  cmake -B build-server . -GNinja -Wno-dev -DWIVRN_BUILD_CLIENT=OFF -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWIVRN_USE_PIPEWIRE=ON
  cmake --build build-server
  systemctl start --user wivrn-git
else
  echo "Nothing to do."
fi
