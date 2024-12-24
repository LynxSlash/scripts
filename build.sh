#!/bin/bash

# Rom source repo
repo init -u https://github.com/ArrowOS-T/android_manifest.git -b arrow-13.1
echo "=================="
echo "Repo init success"
echo "=================="

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# remove already defined modules
rm -rf hardware/ril/libril
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
