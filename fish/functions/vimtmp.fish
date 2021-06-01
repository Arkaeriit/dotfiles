
function vimtmp
	set name (head -n 1 /dev/random | base32 | head -n1)
	vim $name && rm -f $name
end

