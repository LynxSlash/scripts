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
git lfs install && repo init -u https://github.com/ArrowOS-T/android_manifest.git -b arrow-13.1_ext --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone device repositorys
git clone -b lineage-20 https://github.com/arrow-a70q/android_device_samsung_a70q device/samsung/a70q
git clone -b lineage-20 https://github.com/arrow-a70q/android_device_samsung_sm6150-common device/samsung/sm6150-common
git clone -b lineage-20 https://github.com/arrow-a70q/android_kernel_samsung_sm6150 kernel/samsung/sm6150
git clone -b lineage-20 https://github.com/arrow-a70q/proprietary_vendor_samsung_a70q vendor/samsung/a70q
git clone -b lineage-20.0 https://github.com/arrow-a70q/android_hardware_sams hardware/samsung
git clone -b lineage-20 https://github.com/arrow-a70q/android_vendor_samsung_sm6150-common vendor/samsung/sm6150-common
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export
export TZ=Asia/Karachi
export ALLOW_MISSING_DEPENDENCIES=TRUE
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch arrow_a70q-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon
