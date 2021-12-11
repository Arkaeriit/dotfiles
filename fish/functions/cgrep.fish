
function cgrep
    grep -PRI $argv --include '*.h' --include '*.c'
end

