#!/bin/bash

# Exit if one command fails
set -e

# Build the initial sandbox image
singularity build --sandbox nmag-sandbox nmag.def

# Compile the code within the sandbox
singularity exec --writable nmag-sandbox/ bash -c 'cd /usr/share/nmag && make && make clean && ln -sf /usr/share/nmag/bin/* /usr/bin'

# Convert the sandbox image into a singularity container image
singularity build nmag.sif nmag-sandbox/

# Clean up
rm -rf nmag-*
