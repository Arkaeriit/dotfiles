function guirlande
    bash -c "while true; do sleep 1; muteMic; done; >> /dev/null & $argv"
end
