# grep on C source files

function cgrep -d "grep on C source files"
    grep -PRI $argv --include '*.h' --include '*.c'
end

