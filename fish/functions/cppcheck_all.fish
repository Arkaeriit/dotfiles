
# Run cppckeck with all options and pipe the result into more
function cppcheck_all
    cppcheck --quiet --enable=all $argv 2>&1 | more
end

