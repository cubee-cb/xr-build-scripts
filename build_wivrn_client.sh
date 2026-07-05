#!/bin/bash

# place the android commandline tools in:
#   ~/Android/cmdline-tools/latest/bin/
# also add this to PATH
# the zip contains /cmdline-tools/bin/, so just add a latest folder between them
#
# install java 17 jdk from adoptium:
#   sudo dnf install java-17-openjdk-devel
#
# install KTX-Software RPM
# https://github.com/KhronosGroup/KTX-Software/releases
#   sudo rpm -ivh software.rpm
#   (install, verbose, progress)
#
# install other packages:
#   sudo dnf install perl-core
#
# wivrn's keystore setup MUST be done in the wivrn folder;
#   gradle.properties must be next to build.gradle


ADB_INSTALL=1

echo "==============================================="
echo "             Building WiVRn Client"
echo "==============================================="

cd wivrn
export ANDROID_HOME=~/Android
export JAVA_HOME=/usr/lib/jvm/java-17-temurin-jdk/
./gradlew assembleRelease
EXIT_CODE=$?

if [[ EXIT_CODE -eq 0 ]]; then
  if [[ $ADB_INSTALL ]]; then
    echo "Attempting to install WiVRn Client to device..."

    #adb install ./build/outputs/apk/release/WiVRn-release.apk
    adb install ./build/outputs/apk/release/wivrn-release.apk

  fi
else
  echo "Failed!"
  exit 1
fi

echo "Finished building WiVRn Client."
