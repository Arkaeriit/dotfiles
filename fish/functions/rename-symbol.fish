# Replace a name by an other in a whole directory.

function rename-symbol -d 'Rename a symbol in the working directory'
    if [ -z "$argv[1]" ] || [ -z "$argv[2]" ]
        echo "Usage: rename_symbol <old symbol> <new symbol>" > /dev/stderr
        return 1
    end 
    for file in (grep -R "$argv[1]" | cut -d : -f 1 | sort | uniq | grep -v git | grep -v cscope.out)
        echo $file
        sed -i "s:$argv[1]:$argv[2]:g" $file
    end
end

