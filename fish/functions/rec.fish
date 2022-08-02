# Performs audio recording

function rec -d "perform audio recording"
    sox -t alsa default $argv
end
