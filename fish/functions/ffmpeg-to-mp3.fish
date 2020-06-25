#!/usr/local/bin/fish

function ffmpeg-to-mp3
    ffmpeg -i $argv[1] -vn -ar 44100 -ac 2 -b:a 192k $argv[1].mp3
end
