#!/bin/bash

if [ `cat ~/.config/tmux/swichMouseData` == yep ]
then
    tmux set -g mouse off
    echo nope > ~/.config/tmux/swichMouseData
else
    tmux set -g mouse on
    echo yep > ~/.config/tmux/swichMouseData 
fi

