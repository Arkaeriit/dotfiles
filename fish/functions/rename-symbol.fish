# Replace a name by an other in a whole directory.

function rename-symbol -d 'Rename a symbol in the working directory'
    if [ -z "$argv[1]" ] || [ -z "$argv[2]" ]
        echo "Usage: rename_symbol <old symbol> <new symbol>" > /dev/stderr
        return 1
    end 
    for i in (find *)
        sed -i "s:$argv[1]:$argv[2]:g" $i
    end
end

