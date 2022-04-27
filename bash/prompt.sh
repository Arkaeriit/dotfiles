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

#test de début cool
#fancy cursor
#PS1="\[\e[1;34m\]^[n.n]^\[\e[1;36m\] \w ➤\[\e[m\]"
#PS2="\[\e[1;34m\]>[o.-]>\[\e[1;36m\] ➤➤\[\e[m\]"
#normal cursor
PS1="\[$BPurple\]^[n.n]^\[\e[$BYellow\] \w >\[\e[m\]"
PS2="\[$BPurple\]>[o.o]>\[\e[$BYellow] >>\[\e[m\]"

#root
#PS1="\[$BRed\]o[>.<]o\[\e[$BYellow\] \w \[$BRed\]>\[\e[m\]"
#PS2="\[$BRed\]>[x.x]>\[\e[$BYellow] \[$BRed\]>>\[\e[m\]"

#travail
#PS1="\[$BGreen\]o[^.^]o\[\e[$BWhite\] \w \[$BGreen\]>\[\e[m\]"
#PS2="\[$BGreen\]>[o.o]>\[\e[$BWhite] >>\[\e[m\]"

