# Convert the file given as argument into a mp3 file

function ffmpeg-to-mp3 -d "convert file to mp3"
    ffmpeg -i $argv[1] -vn -ar 44100 -ac 2 -b:a 192k $argv[1].mp3
end

