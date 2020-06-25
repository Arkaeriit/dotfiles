#!/bin/sh
git clone https://github.com/vim/killersheep.git
mkdir -p autoload
mkdir -p plugin
mv killersheep/autoload/* autoload/
mv killersheep/plugin/* plugin/
rm -Rf killersheep

