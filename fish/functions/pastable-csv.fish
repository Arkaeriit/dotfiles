# This quick sed transform makes a csv into something pastable on Google sheet.
# This should be used along with the copy alias.

function pastable-csv -d "make a csv pastable in a spreadsheet program"
    sed -e "s','\t'g" $argv
end

