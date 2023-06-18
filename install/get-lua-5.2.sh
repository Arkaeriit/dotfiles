#!/bin/sh
curl -R -O http://www.lua.org/ftp/lua-5.2.4.tar.gz &&
    tar -xzf lua-5.2.4.tar.gz &&
    cd lua-5.2.4 &&
    make linux test &&
    sudo make linux install &&
    cd - &&
    rm -rf lua-5.2* || exit 1

