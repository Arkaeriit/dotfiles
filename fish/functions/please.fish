# Runs the last command as root

function please -d "run last command as root"
    set cmd $history[1]
    fish -c "sudo $cmd"
end

