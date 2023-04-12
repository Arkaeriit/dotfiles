#!/bin/sh

/bin/rm -rfv bundle

# CSCOPE
git clone https://github.com/Arkaeriit/cscope_map_fork.git
mkdir -p bundle/cscope/plugin
mv cscope_map_fork/* bundle/cscope/plugin
rm -Rf cscope_map_fork

# Killersheep
git clone https://github.com/vim/killersheep.git
mkdir -p bundle/killersheep/plugin
mv killersheep/plugin/* bundle/killersheep/plugin/
rm -Rf killersheep

# YCP
mkdir -p bundle
cd bundle
git clone https://github.com/ycm-core/YouCompleteMe.git
cd YouCompleteMe
git submodule update --init --recursive
python3 install.py
cd ../..

# NerdCommenter
cd bundle
git clone https://github.com/preservim/nerdcommenter.git
cd ..

# Rainbow Parentheses
cd bundle
git clone https://github.com/kien/rainbow_parentheses.vim.git
cd ..

# Minimap
cd bundle
git clone https://github.com/severin-lemaignan/vim-minimap.git
cd ..

# Vim-Fish
cd bundle
git clone https://github.com/dag/vim-fish.git
cd ..

# Custom Help
ln -s $PWD/custom_help bundle/custom_help

# Vim-Hex
cd bundle
git clone https://github.com/Arkaeriit/vim-hex.git
cd ..

# Vim-autoformat
cd bundle
git clone https://github.com/vim-autoformat/vim-autoformat.git
cd ..

# Vim-ezgreek
cd bundle
git clone https://github.com/Arkaeriit/vim-ezgreek.git
cd ..

# Vim-localrc
cd bundle
git clone https://github.com/thinca/vim-localrc.git
cd ..

# Vim-ruler
cd bundle
git clone https://github.com/Arkaeriit/vim-ruler
cd ..

