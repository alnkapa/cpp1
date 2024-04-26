#!/bin/bash

# mkdir -p build
#cd build
# rm -rf *
cmake .. -DCMAKE_PROJECT_VERSION_PATCH=2 -DCMAKE_INSTALL_PREFIX=~
cmake --build .
cmake --build . --target=install
cmake --build . --target=test
cmake --build . --target=package