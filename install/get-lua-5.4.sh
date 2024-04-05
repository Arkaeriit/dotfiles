#!/bin/sh
curl -R -L -O http://www.lua.org/ftp/lua-5.4.6.tar.gz &&
    tar -xzf lua-5.4.6.tar.gz &&
    cd lua-5.4.6 &&
    make all test &&
    sudo make install &&
    cd - &&
    rm -rf lua-5.4* || exit 1

