#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
git lfs install && repo init --depth=1 -u https://github.com/Project-PixelStar/manifest -b 14-qpr3 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b PixelStarOS https://github.com/LynxSlash/manifests .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=Lynx
export BUILD_HOSTNAME=crave
export TZ=Asia/Dhaka
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch pixelstar_a70q-ap2a-user
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
