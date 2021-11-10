#!/bin/sh

#CSCOPE
wget http://cscope.sourceforge.net/cscope_maps.vim
mkdir -b bundle/cscope/plugin
mv cscope_maps.vim bundle/cscope/plugin

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

