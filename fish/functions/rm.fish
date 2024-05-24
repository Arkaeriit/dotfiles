# Use rem instead of rm to give me a chance to save files

function rm -d "trash a file"
    if command -v rem > /dev/null
        rem --rm-mode $argv
    else
        command rm $argv
    end
end
