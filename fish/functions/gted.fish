#Permet de se modifier un fichier trouvé gràce à fzf
#On peut donner un argument pour choisir le dossier de départ

function gted -d "edit a file chosen with fzf"
    GENERIC_GTED_GOTO $EDITOR "" $argv[1]
end

