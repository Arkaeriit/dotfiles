# Run cppckeck with all options and pipe the result into the pager

function cppcheck_all
    cppcheck --quiet --enable=all --suppress=missingIncludeSystem $argv 2>&1 | $PAGER
end

