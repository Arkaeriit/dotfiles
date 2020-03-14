#permet de compiler un fichier groff en .ms en corrigeant l'indentation
function groffMS
    if test -n $argv[1]
        set out (echo $argv[1] | sed "s/.ms/.ps/g")
        #/home/maxime/Programmation/Scripts/groff/alligneAgauche.lua $argv[1] | preconv | eqn -Tpdf | groff -ms -Tpdf > $out
        /home/maxime/Programmation/Scripts/groff/alligneAgauche.lua $argv[1] | preconv | groff -e -K utf-8 -ms > $out
    else
        #/home/maxime/Programmation/Scripts/groff/alligneAgauche.lua /dev/stdin | preconv | eqn -Tpdf | groff -ms -Tpdf  
        /home/maxime/Programmation/Scripts/groff/alligneAgauche.lua /dev/stdin | preconv groff -e -K utf-8 -ms  
    end
end
