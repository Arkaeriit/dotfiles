function fish_prompt
    set prev_status $status
    set main_color cyan
    set sec_color blue
    set error_color red
    set smile '^[n.n]^'
    set -x $fish_prompt_pwd_dir_length 0 #permet de ne pas raccoursir le nom des dossiers
    set_color -o $sec_color 
    echo -n $smile
    echo -n ' '
    set_color -o $main_color
    echo -n (prompt_pwd_full) 
    set_color -o $sec_color
    echo -n ' '
    echo -n $fish_chev_vi #variable moddified by fish_mode_promp.fish to tell the vi mode
    if test $prev_status -eq 0 #color evolutive promp
        set_color $main_color
    else
        set_color $error_color
    end
    echo -n '>'
    set_color normal    
end

#Alternative pour le travail:
#set smile 'o[^.^]o '
#set main_color white
#set sec_color green

