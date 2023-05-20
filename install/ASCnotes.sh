#!/bin/sh
git clone https://github.com/Arkaeriit/ASCnotes &&
    cd ASCnotes &&
    make && sudo make install &&
    cd .. &&
    rm -rf ASCnotes

