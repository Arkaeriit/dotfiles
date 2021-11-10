#!/bin/sh

#CSCOPE
git clone https://github.com/Arkaeriit/cscope_map_fork.git
mkdir -p bundle/cscope/plugin
mv cscope_map_fork/* bundle/cscope/plugin
rm -Rf cscope_map_fork

#Killersheep
git clone https://github.com/vim/killersheep.git
mkdir -p bundle/killersheep/plugin
mv killersheep/plugin/* bundle/killersheep/plugin/
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

