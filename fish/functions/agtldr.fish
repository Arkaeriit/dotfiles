# Open a tldr page from gemini in Amfora

function agtldr -d "tldr page in Amfora"
    set prg $argv[1]
    amfora "gemini://freeshell.de/tldr/$prg.gmi"
end

