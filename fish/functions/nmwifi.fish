# Shorthand for nmcli wifi

function nmwifi -d "nmcli device wifi"
    nmcli device wifi $argv
end
