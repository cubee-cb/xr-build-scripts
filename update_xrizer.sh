#!/bin/bash

echo "==============================================="
echo "           Updating xrizer (release)"
echo "==============================================="

cd xrizer
git fetch
if [[ $XR_UP_FORCE_BUILD || `git rev-list HEAD...origin/main --count` > 0 ]]; then
  git pull
  cargo xbuild --release
else
  echo "Nothing to do."
fi
