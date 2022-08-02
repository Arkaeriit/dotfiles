# Use rem instead of rm to give me a chance to save files

function rm -d "trash a file"
    echo "rm est désactivé. Utilisez /bin/rm." && echo "Utilisation de rem à la place."  && rem -q $argv
end
