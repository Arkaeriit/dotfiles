#!/usr/local/bin/lua

---Comandes pour acceder aux infos sur la baterie---
maxC = io.popen("upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E capacity","r")
perC = io.popen("upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E percentage","r")
etatC = io.popen("upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E state","r")
maxS=maxC:read()
perS=perC:read()
etatS=etatC:read()
maxC:close()
perC:close()
etatC:close()

---On traite ces info pour avoir le vrai pourcentage de baterie (atc)---
max=tonumber(maxS:sub(#maxS-3,#maxS-1))
per=tonumber(perS:sub(#perS-3,#perS-1))
atc=math.tointeger(100*per/max)

if etatS:sub(#etatS-8,#etatS)==" charging" then
    if atc>75 then
	    bat="┃███┣"
    elseif atc>50 then
	    bat="┃██⚡┣"
    elseif atc>25 then
	    bat="┃█⚡ ┣"
    else
	    bat="┃ ⚡ ┣"
    end
else
    if atc>75 then
	    bat="┃███┣"
    elseif atc>50 then
	    bat="┃██ ┣"
    elseif atc>25 then
	    bat="┃█  ┣"
    else
	    bat="┃   ┣"
    end
end

io.stdout:write(tostring(atc),"% ",bat)

