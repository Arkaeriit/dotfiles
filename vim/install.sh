#!/bin/sh

/bin/rm -rfv bundle

# CSCOPE
mkdir -p bundle
cd bundle
git clone https://github.com/Arkaeriit/cscope_map_fork.git
cd ..

# Killersheep
git clone https://github.com/vim/killersheep.git
mkdir -p bundle/killersheep/
mv killersheep/* bundle/killersheep/
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

# Vim-autoformat
cd bundle
git clone https://github.com/vim-autoformat/vim-autoformat.git
cd ..

# Vim-hellenika
cd bundle
git clone https://github.com/Arkaeriit/vim-hellenika.git
cd ..

# Vim-Hex
cd bundle
git clone https://github.com/Arkaeriit/vim-hex.git
cd vim-hex
make
cd ../..

# Vim-localrc
cd bundle
git clone https://github.com/thinca/vim-localrc.git
cd ..

# Vim-ruler
cd bundle
git clone https://github.com/Arkaeriit/vim-ruler.git
cd ..

# Vim-blaming
cd bundle
git clone https://github.com/Arkaeriit/vim-blaming.git
cd ..

