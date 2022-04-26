# Open a tldr page from gemini in Amfora

function agtldr
    set prg $argv[1]
    amfora "gemini://freeshell.de/tldr/$prg.gmi"
end

