# Prevent history file to be made in the home dirrectory

function wget -d "get files from the internet"
    /usr/bin/wget --hsts-file="$XDG_DATA_HOME/wget-hsts" $argv
end

