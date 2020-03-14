function makeDebug
    make 2>&1 >/dev/null | head $argv
    #On met stdout dans stderr puis on ne regarde que le début de tout ça. Cela sert à s'occuper des erreurs une à une
end
