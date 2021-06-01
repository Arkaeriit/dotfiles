#!/bin/bash

function installdir {
    cd $1
    make && sudo make install 
    cd -
}

mkdir gitmaki
cd gitmaki

git clone https://github.com/Arkaeriit/asrm
git clone https://github.com/Arkaeriit/luaThreading
git clone https://github.com/Arkaeriit/cursedLua
git clone https://github.com/Arkaeriit/ASCgestionFS
git clone https://github.com/Arkaeriit/snek
git clone https://github.com/Arkaeriit/ASCcrypte
git clone https://github.com/Arkaeriit/ASCluaUtils
git clone https://github.com/Arkaeriit/evenmorelua
git clone https://github.com/Arkaeriit/baseconv
git clone https://github.com/Arkaeriit/brainforth
git clone https://github.com/Arkaeriit/ajtcalc
git clone https://github.com/Arkaeriit/preforth
git clone https://github.com/Arkaeriit/ASCatto
git clone https://github.com/Arkaeriit/ASCnotes

installdir luaThreading
installdir ASCgestionFS
installdir cursedLua
installdir ASCluaUtils
installdir snek
installdir ASCcrypte
installdir evenmorelua
installdir baseconv
installdir ajtcalc
installdir ASCatto
installdir ASCnotes
installdir asrm/simulator
installdir asrm/assembler/asrmpasm
installdir asrm/assembler/asrmmasm

cd preforth
lina -c preforth.frt
sudo cp preforth /usr/local/bin
cd -
installdir brainforth

cd ..

