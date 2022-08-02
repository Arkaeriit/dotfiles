# Copies the first tmux session on the terminal

function embeter-maki -d "copies the first tmux session on the terminal"
    tmux attach -t (tmux ls | grep attached | head -n 1 | awk -F ":" '{print $1}')
end

