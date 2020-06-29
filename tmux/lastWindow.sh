#!/bin/sh
#Return to stdout the name of the last window from the session given as argument
tmux lsw -t $1 | cut -d ' ' -f 8 | sort -r | head -n 1
