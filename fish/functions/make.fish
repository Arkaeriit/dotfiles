# Runs make and ring a bell after it.

function make
	function bell_and_fail
        echo -n \a
		return 1
	end
    set MAKE (which make)
	$MAKE || bell_and_fail && echo -n \a
end

