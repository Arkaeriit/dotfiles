# Choose hexyl if installed and normal hd otherwise

function hd -d "show hexdump"
    if command -v hexyl > /dev/null
        hexyl $argv
    else
        command hd $argv
    end
end

