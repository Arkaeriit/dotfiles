# Open vim as a scratch pad. Give filetype as argument

function vimtmp -d "vim as a scratch pad"
    set sufix "txt"
    if [ -n "$argv[1]" ]
        set sufix "$argv[1]"
    end
	set name (_giberish)
    set name "$name.$sufix"
	vim "/tmp/$name" && rm -f -v "/tmp/$name"
end

