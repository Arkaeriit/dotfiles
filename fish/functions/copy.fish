# Put what is piped here into the X.org clipboard.
# Alternatively, it can be used to copy a file.

function copy -d "copy to X clipboard"
	xclip -selection clipboard $argv
end

