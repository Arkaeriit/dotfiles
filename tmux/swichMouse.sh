#!/bin/bash

if [ `cat ~/.tmux/swichMouseData` == yep ]
then
    tmux set -g mouse off
    echo nope > ~/.tmux/swichMouseData
else
    tmux set -g mouse on
    echo yep > ~/.tmux/swichMouseData 
fi

