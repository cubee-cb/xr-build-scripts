#!/bin/bash

echo "Updating all..."

./update_wivrn.sh
./build_wivrn_client.sh
./update_xrizer.sh
./update_wayvr.sh
