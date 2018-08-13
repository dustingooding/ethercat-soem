#!/bin/sh
sudo apt-get install build-essential cmake

mkdir build
cd build
cmake -DCMAKE_C_COMPILER=kcc -DCMAKE_C_FLAGS="-fissue-report=./my_errors.json" ..
make

# no executable at this time

rv-html-report ./my_errors.json -o report
rv-upload-report `pwd`/report

