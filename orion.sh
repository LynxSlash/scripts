#!/bin/bash

# Remove existing local manifests
rm -rf .repo/local_manifests/

# Initialize the ROM source repository
repo init --depth=1 -u https://github.com/OrionOS-prjkt/android -b 14.0 --git-lfs
echo "=================="
echo "Repo init success"
echo "=================="

# Sync the repositories
/opt/crave/resync.sh
echo "============================"

# Export environment variables
export ORION_MAINTAINER="Lynx"
export ORION_MAINTAINER_LINK="t.me/AliLynx"
export ORION_BUILD_TYPE="UNOFFICIAL"
export ORION_GAPPS=true
export TARGET_ENABLE_BLUR=true
export TARGET_BOOT_ANIMATION_RES=1080
export TARGET_HAS_UDFPS=true
export BUILD_GOOGLE_CONTACTS=true
export BUILD_GOOGLE_DIALER=true
export BUILD_GOOGLE_MESSAGE=true
export ALLOW_MISSING_DEPENDENCIES=true
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch command
lunch lineage_a70q-ap2a-userdebug
echo "============="

# Clean previous build files
mka installclean
echo "============="

# Build the ROM
mka space
