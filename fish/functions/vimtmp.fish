# Open vim as a scratch pad.

function vimtmp -d "vim as a scratch pad"
	set name (head -n 1 /dev/random | base32 | head -n1)
	vim "/tmp/$name" && rm -f -v "/tmp/$name"
end

