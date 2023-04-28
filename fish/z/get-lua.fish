#!/usr/bin/env fish
curl -R -O http://www.lua.org/ftp/lua-5.4.4.tar.gz &&
    tar -xzf lua-5.4.4.tar.gz &&
    cd lua-5.4.4 &&
    make all test &&
    sudo make install

