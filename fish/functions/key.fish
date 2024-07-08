function key -d "Add protected keys to SSH agent"
    if ! ssh-add -L | grep "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL9IiAUxfTlD4EFUeZ5y1pYgIh7d7GbojNYnh3M+dRyG mbouillot@FR308LL013" 1> /dev/null 2> /dev/null
        ssh-add ~/.ssh/id_netatmo_perso
    end
end

