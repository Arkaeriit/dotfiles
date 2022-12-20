# Open vim as a scratch pad. Give filetype as argument

function vimtmp -d "vim as a scratch pad"
    set sufix "txt"
    if [ -n "$argv[1]" ]
        set sufix "$argv[1]"
    end
	set name (head -n 1 /dev/random | base32 | head -n1)
    set name "$name.$sufix"
	vim "/tmp/$name" && rm -f -v "/tmp/$name"
end

