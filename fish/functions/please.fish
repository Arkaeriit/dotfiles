# Runs the last command as root

function please
    set cmd $history[1]
    fish -c "sudo $cmd"
end

