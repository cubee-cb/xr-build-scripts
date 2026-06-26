#!/bin/bash

TARGET_FOLDER=/opt/vapor

echo "==============================================="
echo "           Updating vapor (release)"
echo "==============================================="

cd vapor
git fetch
if [[ $XR_UP_FORCE_BUILD || `git rev-list HEAD...origin/master --count` > 0 ]]; then
  git pull
  cmake -DCMAKE_INSTALL_PREFIX=$TARGET_FOLDER .
  sudo make install

  echo "Installed to \"$TARGET_FOLDER/lib64/VapoR\" <- use this as your OpenVR Runtime path."
else
  echo "Nothing to do."
fi
