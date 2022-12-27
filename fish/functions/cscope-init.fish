# Initialize an empty cscope database

function cscope-init -d "initialize an empty cscope database"
    set FILENAME (_giberish).c
    touch $FILENAME
    cscope -b $FILENAME
    /bin/rm -f $FILENAME
end

