#!/bin/bash

if [ "$1" == 'h' ]
then
    curDir=$(pwd)
    tmux split-window -h
    tmux send-keys "cd $curDir" Enter
    tmux send-keys "clear" Enter
else
    curDir=$(pwd)
    tmux split-window -v
    tmux send-keys "cd $curDir" Enter
    tmux send-keys "clear" Enter
fi


  
