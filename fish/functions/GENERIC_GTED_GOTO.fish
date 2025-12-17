# Gère le traitement utilisé dans gted et goto.
# Le premier argument est la commande à lancer,
# le second est un argument pour find et le
# troisième est optionellement le dossier de
# départ.
function GENERIC_GTED_GOTO
    if test -z "$argv[1]"
        return 2
    end
    if test -n "$argv[3]"
        set source $argv[3]
    else
        set source '.'
    end
    set target (find "$source" (echo $argv[2] | string split " ") 2> /dev/null | fzf -e +m -i) #On inclu les fichiers masqués #on cherche les correspondances exactes, seules, la case ne compte pas 
    if test -n "$target"
        "$argv[1]" "$target"
    else
        return 1
    end
end

