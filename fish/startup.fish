#!/usr/local/bin/fish

ASCnotes read 21600
alias minicom='minicom -con -R utf-8 -D /dev/ttyUSB0 -b 115200 '
unset fish_chev_vi

# Ensure fish doen't repport itself as bash
unset SHELL
set -Ux SHELL (which fish)

# Add Netatmo compilation passwords
if [ -z $KEY_MOUNTED ]
    set -Ux KEY_MOUNTED yep
    #$NETATMO_WORK_DIR/embedded/modules/magellan-keys/pass_tool.sh -m
    set -Ux PASSWORD_STORE_DIR "$NETATMO_WORK_DIR/embedded/modules/magellan-keys"
    for key in (pass find NTM | grep -v : | sed 's:[^A-Z_]::g')
        set -Ux $key (pass $key)
    end
end

# Ensure fish doen't repport itself as bash
unset SHELL
set -Ux SHELL (which fish)

