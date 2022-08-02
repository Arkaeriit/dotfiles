#!/usr/local/bin/fish

# Push the master branch to origin

function gpom -d "git push origin master"
    git push origin master $argv
end

