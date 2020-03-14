#!/usr/local/bin/lua

function readDisk() --donne lesinfos sur l'espace dans les disques
  local cmd = io.popen("df -l --output=target,used,size","r")
  local tab={}
  local flag = true
  while flag do
    local str=cmd:read() --on lit un des disques
    if str then
      local temp=str:decoupeStr(" ") --temp est une liste qui contien 1:le nom de la partition 2:l'espace disponible 3:l'espace total
      temp=netoieTabStr(temp,"")
      if temp[1]:sub(1,1)=="/" then tab[#tab+1]=temp end
    else
      flag=false
    end
  end
  cmd:close()
  return tab
end

function decoupeStr(str,char) --comme le str.split de python
  local ret={""}
  for i=1,#str do
    if str:sub(i,i)==char then
      ret[#ret+1]=""
    else
      ret[#ret]=ret[#ret]..str:sub(i,i)
    end
  end
  return ret
end string.decoupeStr=decoupeStr

function netoieTabStr(Tab,elem)  --elève tout les éléments égals à elem dans un array
  local ret={}
  for i=1,#Tab do
    if Tab[i]~=elem then
      ret[#ret+1]=Tab[i]
    end
  end
  return ret
end

function getUsed(disksTab) --permet de savoir à quel point / est remplis
    for i=1,#disksTab do
       if disksTab[i][1]=="/" then
            return disksTab[i][2]/disksTab[i][3]
        end
    end
    return 0
end

rateUsed = getUsed(readDisk())
pru = tostring(rateUsed * 100):sub(1,2) -- pourcent tronqué à 1%
io.stdout:write(" / : "..pru.."% ")
