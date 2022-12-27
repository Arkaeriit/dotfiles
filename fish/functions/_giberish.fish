function _giberish -d "Echo some noise"
    head -c 80 /dev/random | base32 | head -n1
end

