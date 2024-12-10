#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b pos hhttps://github.com/LynxSlash/Panda_local_manifests .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Remove Samsung stuff
rm -rf device/samsung/sm6150-common/livedisplay
rm -rf hardware/samsung/hidl/livedisplay
rn -rf hardware/samsung/AdvancedDisplay
rm -rf hardware/samsung/doze
rm -rf hardware/ril/libril

# Export
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=crave
export TZ=Asia/Karachi
export ALLOW_MISSING_DEPENDENCIES=TRUE
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=TRUE
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch aosp_a70q-ap2a-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
make bacon
