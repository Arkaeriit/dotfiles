function fish_prompt
    set -x $fish_prompt_pwd_dir_length 0 #permet de ne pas raccoursir le nom des dossiers
    set_color -o blue 
    echo -n '^[n.n]^ '
    set_color -o cyan
    echo -n (prompt_pwd_full) 
    if test $status -eq 0 #We want the color of the > to reflect the exit status of the last command
        set_color cyan
    else
        set_color grey
    end
    echo -n ' >'
    set_color normal    
end

#Alternative pour le travail:
#function fish_prompt
#    set -x $fish_prompt_pwd_dir_length 0 #permet de ne pas raccoursir le nom des dossiers
#    set_color -o green
#    echo -n 'o[^.^]o '
#    set_color -o grey
#    echo -n (prompt_pwd_full) 
#    if test $status -eq 0 #We want the color of the > to reflect the exit status of the last command
#        set_color green
#    else
#        set_color grey
#    end
#    echo -n ' >'
#    set_color normal    
#end

