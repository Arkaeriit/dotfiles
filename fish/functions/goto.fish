#Permet de se diriger vers un dossier ou le dossier contenant le fichier activé par fzf on peut donner un argument en entrée pour choisir le dossier de départ

function goto -d "go to a directory"
    GENERIC_GTED_GOTO cd "-type d" $argv[1]
end

