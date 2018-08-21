#!/bin/sh
sudo apt-get install -y build-essential cmake

mkdir build
cd build
cmake -DCMAKE_C_COMPILER=kcc -DCMAKE_C_FLAGS="-std=gnu11 -DPACKED='__attribute__((__packed__))' -DPACKED_BEGIN='' -DPACKED_END='' -fissue-report=./my_errors.json" ..
make

# no executable at this time

rv-html-report ./my_errors.json -o report
rv-upload-report `pwd`/report

