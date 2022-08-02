#Permet de se diriger vers un dossier ou le dossier contenant le fichier activé par fzf on peut donner un argument en entrée pour choisir le dossier de départ
function goto
    GENERIC_GTED_GOTO cd "-type d" $argv[2]
end

