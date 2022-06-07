# Prevent history file to be made in the home dirrectory

function wget
    wget --hsts-file="$XDG_DATA_HOME/wget-hsts" $argv
end

