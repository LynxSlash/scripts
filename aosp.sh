#!/bin/bash

rm -rf .repo/local_manifests/
rm -rf device/samsung/a70q
rm -rf device/samsung/sm6150-common
rm -rf kernel/samsung/sm6150
rm -rf vendor/samsung/a70q
rm -rf vendor/samsung/sm6150-common
rm -rf hardware/samsung

# Rom source repo
repo init -u https://github.com/PixelExperience-LEGACY-edition/manifest.git -b thirteen-plus --depth=1 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone device repositorys
git clone https://github.com/LynxSlash/manifests -b A13_a70q .repo/local_manifests

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
lunch aosp_a70q-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon -j$(nproc --all) | tee log.txt
