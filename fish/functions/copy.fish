# Put what is piped here into the X.org clipboard.
# Alternatively, it can be used to copy a file.

function copy
	xclip -selection clipboard $argv
end

