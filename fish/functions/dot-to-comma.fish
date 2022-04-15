# Sed command to replace dots to commas.
# Used to make google sheet valid numbers.

function dot-to-comma
    sed 's/\./\,/g'
end

