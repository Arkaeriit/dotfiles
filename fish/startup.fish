#!/usr/local/bin/fish

ASCnotes read 21600
alias minicom='minicom -con -R utf-8 -D /dev/ttyUSB0 -b 115200 '
unset fish_chev_vi

# Ensure fish doen't repport itself as bash
unset SHELL
set -Ux SHELL (which fish)

# SiLab gives a tool called commander or commander-cli depending on the version.
# Those functions create conditional aliases to always have both names available.
if not command -v commander > /dev/null
    function commander -d "alias to commander-cli"
        commander-cli $argv
    end
end
if not command -v commander-cli > /dev/null
    function commander-cli -d "alias to commander"
        commander $argv
    end
end

