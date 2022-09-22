# Initialize an empty cscope database

function cscope-init -d "initialize an empty cscope database"
    set FILENAME (tempfile -s .c -p MT-C-File-)
    cscope -b $FILENAME
    /bin/rm -f $FILENAME
end

