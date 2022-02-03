#!/usr/local/bin/fish

# Push the master branch to origin

function gpom
    git push origin master $argv
end

