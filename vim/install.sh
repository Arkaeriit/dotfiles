#!/bin/sh
#Killersheep
git clone https://github.com/vim/killersheep.git
mkdir -p autoload
mkdir -p plugin
mv killersheep/autoload/* autoload/
mv killersheep/plugin/* plugin/
rm -Rf killersheep

#YCP
cd bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py
cd ../..

#NerdCommenter
cd bundle
git clone https://github.com/preservim/nerdcommenter.git
cd ..

