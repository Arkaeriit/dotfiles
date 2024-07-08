# This function makes you root and quit your shell when you leave the root shell

function root -d "sudo su"
    exec su
end

