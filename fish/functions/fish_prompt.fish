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
