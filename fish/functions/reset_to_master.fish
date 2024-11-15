# Reset a file to what it is on the master branch
# Use the second argument to indicate a specific branch

function reset_to_master -d "Reset a file to it's master branch value"
    if [ -n "$argv[2]" ]
        set branch "$argv[2]"
    else
        set branch master
    end
    set target_file "$argv[1]"
    git show "$branch":"$target_file" > "$target_file"
end

