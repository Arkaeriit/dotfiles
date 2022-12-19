# Run cppckeck with all options and pipe the result into the pager

function cppcheck_all -d "generous cppcheck config"
    cppcheck --quiet --enable=all --suppress=unusedFunction --suppress=missingIncludeSystem $argv 2>&1 | $PAGER
end

