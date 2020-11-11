#!/usr/local/bin/fish

function embeter-maki
    tmux attach -t (tmux ls | grep attached | head -n 1 | awk -F ":" '{print $1}')
end

