# Makes a commit with the message given as argument and then let you edit the
# commit in you favorite editor.

function gc
    git commit -m  $argv && git commit --amend
end
