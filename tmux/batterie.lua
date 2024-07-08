#!/usr/local/bin/lua

---Comandes pour acceder aux infos sur la baterie---
perC = io.popen("upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E percentage","r")
etatC = io.popen("upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -E state","r")
perS=perC:read()
etatS=etatC:read()
perC:close()
etatC:close()

commaToDot = function(str)
    ret = ""
    for i=1,#str do
        if str:sub(i,i) == "," then
            ret = ret.."."
        else
            ret = ret..str:sub(i,i)
        end
    end
    return ret
end

findnumber = function(str)
    local i = 1;
    while str:sub(i,i) ~= tostring(tonumber(str:sub(i,i))) do
        i = i+1
    end
    local strRet = (str:sub(i,#str-1))
    return tonumber(commaToDot(strRet))
end

---On traite ces info pour avoir le vrai pourcentage de baterie (atc)---
per = findnumber(perS)
atc=math.floor((100*per) / 100 + 0.5)

--symbol for charge. The look depend on the font and the terminal
elec = '☳'
--elec = '⚡'
if etatS:sub(#etatS-8,#etatS)==" charging" then
    if atc>75 then
	    bat="┃███┣"
    elseif atc>50 then
	    bat="┃█"..elec.."█┣"
    elseif atc>25 then
	    bat="┃█"..elec.." ┣"
    else
	    bat="┃ "..elec.." ┣"
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

