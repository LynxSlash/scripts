#!/bin/bash

export ALLOW_MISSING_DEPENDENCIES=TRUE
export BUILD_BROKEN_MISSING_REQUIRED_MODULES=TRUE
echo "======= Export Done ======"

# Set up build environment
source build/envsetup.sh
echo "====== Envsetup Done ======="

# Lunch
lunch pixelstar_a70q-ap2a-eng
echo "============="

# Make cleaninstall
make installclean
echo "============="

# Build rom
mka bacon


lunch pixelstar_a70q-eng

mka bacon

lunch pixelstar_a70q-userdebug
