#!/bin/bash

#if command -v tmux>/dev/null; then #lance tmux
#        if [ ! -z "$PS1" ]; then 
#                [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && tmux
#        fi
#fi
tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf &> /dev/null

ASCnotes read #lance ASCnotes

