#!/bin/bash

# Couleurs
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Gras
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset

SMILE1="^[n.n]^"
SMILE2=">[o.o]>"

# When $1 is 0, return the color code of the PWD.
# If it is not, return the error color code.
# An escape char needs to be put before the code to use it.
dynamic_chevron_color() {
    if [ "$1" = "0" ]
    then
        used_color="$COL_PWD"
    else
        used_color="$COL_ERROR"
    fi
    color_code=$(echo $used_color | cut -d '[' -f 2)
    printf '%c%s' '[' "$color_code"
}
COL_ERROR_ON_STATUS="\e\$(dynamic_chevron_color \$((\$?==0?0:1)))"

COL_ERROR="$Red"
COL_PWD="$BWhite"
COL_EXTRA="$BBlue"

PS1="\[$COL_EXTRA\]$SMILE1\[\e[$COL_PWD\] \w \[$COL_ERROR_ON_STATUS\]>$NC"
PS2="\[$COL_EXTRA\]$SMILE2\[\e[$COL_PWD\] \[$COL_PWD\]>>$NC"

