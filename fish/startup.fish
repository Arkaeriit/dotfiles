#!/usr/local/bin/fish

ASCnotes read 21600
alias minicom='minicom -con -R utf-8 -D /dev/ttyUSB0 -b 1000000 '
unset fish_chev_vi

# Ensure fish doen't repport itself as bash
unset SHELL
set -Ux SHELL (which fish)

