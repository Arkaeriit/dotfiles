# Add yubikey in SSH agent

function yubiadd -d "add yubikey in ssh agent"
    ssh-add -e /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so &>/dev/null ; ssh-add -s /usr/lib/x86_64-linux-gnu/opensc-pkcs11.so
end

