
# Run cppckeck with all options and pipe the result into more
function cppcheck_all
    cppcheck --quiet --enable=all --suppress=missingIncludeSystem $argv 2>&1 | $PAGER
end

