# Runs vim as a pager reading from stdin

function pagevim -d "read stdin in vim"
	vim -S ~/.config/vim/pager.vim -
end	

