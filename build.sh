#!/bin/bash

# Build rom
mka bacon -j$(nproc --all) | tee log.txt
