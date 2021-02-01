#!/bin/sh
tmux new-window -t Vivado -n $(basename $1) vim $1

