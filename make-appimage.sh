#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export USE_HOST_DRIVERS_EXPERIMENTAL=1

# Deploy dependencies
quick-sharun ./AppDir/bin/postal1

# Turn AppDir into AppImage
quick-sharun --make-appimage
