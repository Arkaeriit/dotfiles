#!/bin/sh
branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

git checkout master &&
    git pull origin master &&
    git checkout "$branch" &&
    git rebase master &&
    git push origin "$branch" -f &&
    echo "Done!"

