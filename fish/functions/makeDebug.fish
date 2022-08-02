# On met stdout dans stderr puis on ne regarde que le début de tout ça. Cela sert à s'occuper des erreurs une à une

function makeDebug -d "readable make error output"
    make 2>&1 >/dev/null | head $argv
end
