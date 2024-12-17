#!/bin/bash

rm -rf device/samsung/sm6150-common
git clone -b lineage-21 https://github.com/LynxSlash/android_device_samsung_sm6150-common device/samsung/sm6150-common

# Export
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=crave
export TZ=Asia/Karachi
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_a70q-ap2a-user
echo "============="

# Build rom
mka bacon
