#!/bin/bash

export EDITOR='vim'
export VISUAL='vim'
CXX=/usr/bin/g++
export CXX

if command -v bat > /dev/null
then
    export PAGER='bat --tabs 4 --style=header,grid --decorations auto --color always --paging auto --theme Nord --wrap never'
else
    if command -v less > /dev/null
    then
        export PAGER='less'
    else
        export PAGER='more'
    fi
fi

eval "$(lua $HOME/.config/fish/z/z.lua --init bash)"

