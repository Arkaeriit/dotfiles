# Open vim to write in the X clipboard

function vimtype -d "open vim to write in the X clipboard"
	set name (head -n 1 /dev/random | base32 | head -n1)
	vim $name && sed -z -i -e 's:\n$::' $name && copy $name && /bin/rm -f $name
end

