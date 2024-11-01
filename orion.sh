#!/bin/bash

rm -rf .repo/local_manifests/

# Rom source repo
repo init --depth=1 -u https://github.com/OrionOS-prjkt/android -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Clone local_manifests repository
git clone -b lineage-21 https://github.com/LynxSlash/Panda_local_manifests .repo/local_manifests
echo "============================"
echo "Local manifest clone success"
echo "============================"

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# remove useless repositories
rm -rf hardware/samsung/AdvancedDisplay
rm -rf hardware/samsung/doze
echo "============================"

# Export
export BUILD_USERNAME=lynx
export BUILD_HOSTNAME=crave
export TZ=Asia/Dhaka
export ALLOW_MISSING_DEPENDENCIES=TRUE
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch orion_a70q-ap2a-userdebug
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka space
