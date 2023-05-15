# Sane dd defaults

function ddsync -d "dd with sudo, sync, and progress"
    sudo dd conv=fdatasync bs=4M status=progress $argv
end

