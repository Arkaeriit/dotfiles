# Sed command to replace dots to commas.
# Used to make google sheet valid numbers.

function dot-to-comma -d "substitute dots for commas"
    sed 's/\./\,/g'
end

