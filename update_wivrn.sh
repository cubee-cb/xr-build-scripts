#!/bin/bash

TARGET_FOLDER=/opt/wivrn

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
    #sudo install -CDt $TARGET_FOLDER build-server/server/{wivrn-server,wivrnctl}
    #sudo install -CDt $TARGET_FOLDER images/wivrn.svg
    #echo "Installed to \"$TARGET_FOLDER\" <- This is where the WiVRn Server is."
    sudo ln -fs $(pwd)/build-dashboard/server/{wivrn-server,wivrnctl} /opt/wivrn/
    echo "Linked server executables to /opt/wivrn/"

  # build dashboard
  else
    cmake -B build-dashboard . -GNinja -Wno-dev -DWIVRN_BUILD_CLIENT=OFF -DWIVRN_BUILD_SERVER=ON -DWIVRN_BUILD_DASHBOARD=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo -DWIVRN_USE_PIPEWIRE=ON
    cmake --build build-dashboard
    #sudo install -CDt $TARGET_FOLDER build-dashboard/server/{wivrn-dashboard,wivrn-server,wivrnctl}
    #sudo install -CDt $TARGET_FOLDER images/wivrn.svg
    #echo "Installed to \"$TARGET_FOLDER\" <- This is where the WiVRn Dashboard is."
    sudo ln -fs $(pwd)/build-dashboard/server/{wivrn-dashboard,wivrn-server,wivrnctl} /opt/wivrn/
    echo "Linked dashboard executables to /opt/wivrn/"
  fi
else
  echo "Nothing to do."
fi
