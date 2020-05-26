#!/bin/bash

#allias perso
alias clr='clear && clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias moc='if [ -z $TMUX ]; then if [ $TERM == linux ]; then mocp -O ASCIILines=yes; else mocp; fi; else mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi;' #music player, on prend en compte que l'affichage est un peu nul dans tmux
alias mocmoc='if [ -z $TMUX ]; then if [ $TERM == linux ]; then exec mocp -O ASCIILines=yes; else exec mocp; fi; else exec mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi;' #comme moc mais coupe la session après, parfait poour les tty
alias rec='sox -t alsa default' #permet de faire des enregistrements audio
alias dimentions='/home/maxime/Programmation/Cperso/ncurse/dimentions/quelleDimentions'
alias Off='shutdown +0'
alias muteMic='amixer set Capture toggle'
alias findHere='find . -name '
alias nmwifi='nmcli device wifi'
alias sudo='sudo '
alias rm='echo "rm est désactivé. Utilisez /bin/rm." && echo "Utilisation de trash à la place."  && trash'
alias please='sudo $(fc -ln -1)'
alias lw='libreoffice --writer'
alias gc='git commit -m '
alias jc='echo "javac *.java" && javac *.java'
alias power='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
alias makeDebug='make 2>&1 >/dev/null | head' #On met stdout dans stderr puis on ne regarde que le début de tout ça. Cela sert à s'occuper des erreurs une à une
alias ping='/usr/bin/ping -c 5'

