#!/bin/bash

# set -ex # usefull for debugging things

# Get in appropriate directory and unlimit stack
cd /app 
ulimit -s unlimited 

# Config
eval `opam config env` &> /dev/null

# Build
jbuilder build /app/src/main.ml

# and Run!
/app/_build/default/src/main.exe