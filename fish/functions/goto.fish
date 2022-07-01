#Permet de se diriger vers un dossier ou le dossier contenant le fichier activé par fzf on peut donner un argument en entrée pour choisir le dossier de départ
function goto
    if test -n "$argv[1]"
        set target $argv[1]
    else
        set target '/'
    end
    cd (find $target -type d 2> /dev/null | fzf -e +m -i) #On inclu les fichiers masqués #on cherche les correspondances exactes, seules, la case ne compte pas
end
