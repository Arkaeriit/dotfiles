# Display info about the battery

function power -d "display info about the battery"
    upower -i /org/freedesktop/UPower/devices/battery_BAT0
end

