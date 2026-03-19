#!/bin/bash

echo "Running all updates with forced build..."

export XR_UP_FORCE_BUILD=1
./update_all.sh
