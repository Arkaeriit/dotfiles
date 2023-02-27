# Run cppckeck with all options and pipe the result into the pager

function cppcheck_sane -d "sane cppcheck config"
    cppcheck -j 20 --quiet --enable=warning,performance,information --suppress=unusedFunction --suppress=missingIncludeSystem $argv 2>&1 | $PAGER
end

