#!/bin/bash

TARGET_FOLDER=/opt/xrizer

echo "==============================================="
echo "           Updating xrizer (release)"
echo "==============================================="

cd xrizer
git fetch
if [[ $XR_UP_FORCE_BUILD || `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  cargo xbuild --release
  sudo mkdir -p $TARGET_FOLDER
  sudo cp -rL target/release/bin $TARGET_FOLDER # copy and flatten symlinks
  echo "Copied to \"$TARGET_FOLDER\" <- use this as your OpenVR Runtime path."
else
  echo "Nothing to do."
fi
