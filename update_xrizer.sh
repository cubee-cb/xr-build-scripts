#!/bin/bash

TARGET_FOLDER=/opt/xrizer

echo "==============================================="
echo "           Updating xrizer (release)"
echo "==============================================="

# xrizer/bin/linux64/ contains a symlink to the build folder - will this be an issue? should i replace it with a symlink to /opt/xrizer/xrizer ?

cd xrizer
git fetch
if [[ $XR_UP_FORCE_BUILD || `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  cargo xbuild --release
  sudo mkdir -p $TARGET_FOLDER
  sudo cp -r target/release/* $TARGET_FOLDER
  echo "Copied to \"$TARGET_FOLDER\" <- use this as your OpenVR Runtime path."
else
  echo "Nothing to do."
fi
