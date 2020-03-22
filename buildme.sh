#!/bin/sh
set -e

git submodule init
git submodule update

echo "building yara"
cd yara
./bootstrap.sh
./configure
make
cd ..

echo "building libpcap"
cd libpcap
./configure
make
cd ..

echo "building enoch"
./bootstrap.sh
./configure --with-yara=./yara --with-libpcap=./libpcap
make

echo "Done :)"
