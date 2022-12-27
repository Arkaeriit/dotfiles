# Open vim to write in the X clipboard

function vimtype -d "open vim to write in the X clipboard"
	set name (_giberish)
	vim $name && sed -z -i -e 's:\n$::' $name && copy $name && /bin/rm -f $name
end

