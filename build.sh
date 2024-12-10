#!/bin/bash

export ALLOW_MISSING_DEPENDENCIES=TRUE
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=TRUE
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch aosp_a70q-ap2a-userdebug
echo "============="

# Build rom
make bacon
