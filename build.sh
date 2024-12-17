#!/bin/bash

rm -rf device/samsung/a70q
rm -rf device/samsung/sm6150-common
rm -rf kernel/samsung/sm6150
rm -rf vendor/samsung/a70q
rm -rf vendor/samsung/sm6150-common
rm -rf hardware/samsung
git clone -b lineage-21 https://github.com/LineageOS/android_device_samsung_a70q device/samsung/a70q
git clone -b lineage-21 https://github.com/LineageOS/android_device_samsung_sm6150-common device/samsung/sm6150-common
git clone -b lineage-21 https://github.com/LineageOS/android_kernel_samsung_sm6150 kernel/samsung/sm6150
git clone -b lineage-21 https://github.com/a70q-lineage/proprietary_vendor_samsung_a70q vendor/samsung/a70q
git clone -b lineage-21 https://github.com/a70q-lineage/proprietary_vendor_samsung_sm6150-common vendor/samsung/sm6150-common
git clone -b lineage-21 https://github.com/LineageOS/android_hardware_samsung hardware/samsung

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
