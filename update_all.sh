#!/bin/bash

echo "Updating all..."

export XR_UP_USE_SYSTEMD=0
export XR_UP_WAYVR_FEATURES="wayland,openxr,osc"

if [[ $XR_UP_HEADLESS ]]; then
  ./update_wivrn_headless.sh
else
  ./update_wivrn.sh
fi
./update_xrizer.sh
./update_wayvr.sh
