#Permet de se modifier un fichier trouvé gràce à fzf
#On peut donner un argument pour choisir le fichier de départ
function gted
    if test -n $argv[1]
        $EDITOR (find $argv[1] | fzf -e +m -i) #On inclu les fichiers masqués #on cherche les correspondances exactes, seules, la case ne compte pas 
    else
        $EDITOR (find . | fzf -e +m -i) #On inclu les fichiers masqués #on cherche les correspondances exactes, seules, la case ne compte pas 
    end
end
