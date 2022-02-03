# Runs a quick make and if there is an error, runs it slow to pinpoint where
# the issue is.
function make_verif
    /usr/bin/make clean -j && /usr/bin/make -j 32 || /usr/bin/make && bell
end

