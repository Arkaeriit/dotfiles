#!/usr/bin/fish
#Text to speech en français
function sayFR
    espeak "$argv" -g 5 -s 130 --stdout -v fr | aplay
end

