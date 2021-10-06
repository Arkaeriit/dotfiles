function make
	function bell_and_fail
		bell
		return 1
	end
	/usr/bin/make $argv || bell_and_fail && bell
end

