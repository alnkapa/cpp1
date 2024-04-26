#!bin/bash

mkdir -p build
cd build
rm -rf *
cmake .. -DCMAKE_INSTALL_PREFIX=~
cmake --build .
cmake --build . --target=install
cmake --build . --target=package