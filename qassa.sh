#!/bin/bash
remove old repos
rm -rf .repo/local_manifests/
rm -rf device/samsung/a70q
rm -rf device/samsung/sm6150-common
rm -rf kernel/samsung/sm6150
rm -rf vendor/samsung/a70q
rm -rf vendor/samsung/sm6150-common
rm -rf hardware/samsung

# Rom source repo
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1
echo "=================="
echo "Repo init success"
echo "=================="

# Clone device repositorys
git clone -b cr10 https://github.com/sm7150/android_device_samsung_a70q device/samsung/a70q
git clone -b lineage-17.1 https://github.com/sm7150/a70qkernel kernel/samsung/sm6150
git clone -b lineage-17.1 https://github.com/sm7150/proprietary_vendor_samsung_a70q vendor/samsung
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export BUILD_USERNAME=Lynx
export BUILD_HOSTNAME=crave
export TZ=Asia/Karachi
export ALLOW_MISSING_DEPENDENCIES=TRUE
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch lineage_a70q-eng
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
