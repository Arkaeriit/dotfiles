# Runs make and ring a bell after it.

function make
    function bell_and_fail
        set last_status $status
        echo -n \a
        return $last_status
    end
    set MAKE (which make)
    $MAKE $argv || bell_and_fail && echo -n \a
end

