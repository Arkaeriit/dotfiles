function fish_prompt
    # Symbols definition
    set prev_status $status
    set main_color F8D08D
    set sec_color D000C0
    set error_color red
    set smile '^[n.n]^ '
    set -x $fish_prompt_pwd_dir_length 0 # permet de ne pas raccoursir le nom des dossiers
    set __pwd (prompt_pwd_full)" "

    # Checking the size of the prompt and removing excessive elements
    set long_prompt "$smile $__pwd $fish_chev_vi >"
    set len_prompt (string length "$long_prompt")
    if test $len_prompt -ge $COLUMNS # Testing full path
        set __pwd (prompt_pwd)" "
        set long_prompt "$smile $__pwd $fish_chev_vi >"
        set len_prompt (string length "$long_prompt")
        if test $len_prompt -ge $COLUMNS # Testing reduced path
            set __pwd (basename $PWD)" "
            set long_ish_prompt "$smile $__pwd $fish_chev_vi >"
            set len_prompt (string length "$long_ish_prompt")
            if test $len_prompt -ge $COLUMNS # Testing only basename of dir
                set __pwd ""
                set smaler_prompt "$smile $fish_chev_vi >"
                set len_prompt (string length "$smaler_promt")
                if test $len_prompt -ge $COLUMNS # Testing no dir name
                    set smile ""
                    set smol_prompt "$fish_chev_vi >"
                    set len_prompt (string length "$smol_promt")
                    if test $len_prompt -ge $COLUMNS # Testing no smile
                        set fish_chev_vi "" # No smile and no vi mode indication
                    end
                end
            end
        end
    end
    
    # Printing smile
    set_color -o $sec_color 
    echo -n $smile

    # Printing working directory
    set_color -o $main_color
    #echo -n (prompt_pwd_full) 
    echo -n "$__pwd"

    # Printing Vi-mode hint
    set_color -o $sec_color
    echo -n $fish_chev_vi #variable moddified by fish_mode_promp.fish to tell the vi mode

    # Printing colored chevron
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

