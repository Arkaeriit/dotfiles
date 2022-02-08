#!/bin/bash

#allias perso
alias clr='clear && clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias lh='ls -lh'
alias ll='ls -l'
alias moc='if [ -z $TMUX ]; then if [ $TERM == linux ]; then mocp -O ASCIILines=yes; else mocp; fi; else mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi;' #music player, on prend en compte que l'affichage est un peu nul dans tmux
alias mocmoc='if [ -z $TMUX ]; then if [ $TERM == linux ]; then exec mocp -O ASCIILines=yes; else exec mocp; fi; else exec mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi;' #comme moc mais coupe la session après, parfait poour les tty
alias rec='sox -t alsa default' #permet de faire des enregistrements audio
alias dimentions='/home/maxime/Programmation/Cperso/ncurse/dimentions/quelleDimentions'
alias Off='systemctl poweroff'
alias muteMic='amixer set Capture toggle'
alias findHere='find . -name ' # Find a file in the working directory
alias nmwifi='nmcli device wifi'
alias sudo='sudo '
alias rm='echo "rm est désactivé. Utilisez /bin/rm." && echo "Utilisation de trash à la place."  && trash'
alias please='sudo $(fc -ln -1)'
alias lw='libreoffice --writer'
alias gc='git commit -m '
alias jc='echo "javac *.java" && javac *.java'
alias power='upower -i /org/freedesktop/UPower/devices/battery_BAT0' # Display info about the battery
alias makeDebug='make 2>&1 >/dev/null | head' #On met stdout dans stderr puis on ne regarde que le début de tout ça. Cela sert à s'occuper des erreurs une à une
alias ping='/usr/bin/ping -c 5'
alias root='exec sudo su' # Makes you root and leave the shell afterward
alias analog-city='sshpass -p hightech ssh analog-city' # Connect to the SSH textboard with the password
alias copy='xclip -selection clipboard' # Put what is piped here into the X.org clipboard
alias cppcheck_all='cppcheck --quiet --enable=all --suppress=missingIncludeSystem $argv 2>&1 | $PAGER' # Run cppckeck with all options and pipe the result into the pager
alias gpom='git push origin master' # Push the master branch to origin
alias make_verif='/usr/bin/make clean -j && /usr/bin/make -j 32 || /usr/bin/make && bell' # Runs a quick make and if there is an error, runs it slow to pinpoint where the issue is.
alias pagevim="vim -S ~/.config/vim/pager.vim -" # Runs vim as a pager reading from stdin
alias :q="exit"
alias sayFR="espeak "$argv" -g 5 -s 130 --stdout -v fr | aplay" # Text to speech en français
alias pastable-csv='sed -e "s/,/\t/g" ' # This quick sed transform makes a csv into something pastable on Google sheet. This should be used along with the copy alias.


# Convert the file given as argument into a mp3 file
ffmpeg-to-mp3() {
    ffmpeg -i $1 -vn -ar 44100 -ac 2 -b:a 192k $1.mp3
}

# Open vim as a scratch pad.
vimtmp () {
	name=$(head -n 1 /dev/random | base32 | head -n1)
	vim $name && rm -f $name
}

