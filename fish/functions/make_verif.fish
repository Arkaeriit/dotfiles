# Runs a quick make and if there is an error, runs it slow to pinpoint where
# the issue is.

function make_verif -d "easy error finding in parallel compilation"
    set MAKE (which make)
    $MAKE clean -j && $MAKE -j 32 || $MAKE && echo -n \a
end

