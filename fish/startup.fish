#!/usr/local/bin/fish

if test -d $SSH_CLIENT
    tmux -f "$XDG_CONFIG_HOME"/tmux/tmux.conf ^ /dev/null
end

ASCnotes read
alias minicom='minicom -con'
unset fish_chev_vi

