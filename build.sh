#!/bin/bash

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
