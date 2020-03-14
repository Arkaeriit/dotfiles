#Permet de se diriger vers un dossier ou le dossier contenant le fichier activé par fzf on peut donner un argument en entrée pour choisir le dossier de départ
function goto
    if test -n $argv[1]
        set f (find $argv[1] | fzf -e +m -i)
    else
        set f (find . | fzf -e +m -i) #On inclu les fichiers masqués #on cherche les correspondances exactes, seules, la case ne compte pas 
    end

    if test -d $f 
        cd $f
    else
        cd (echo $f | lua -e '
            fi = io.stdin:read() --On récupère le nom du dossier contenant le fichier sélectionné 
            for i=0,(#fi-1) do
                j = #fi - i
                if fi:sub(j,j) == "/" then
                    io.stdout:write(fi:sub(1,j))
                    break
                end
            end')
    end
end
