#!/bin/bash

#allias perso
alias clr='clear && clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'
alias lh='ls -lh'
alias ll='ls -l'
alias moc='if [ -z $TMUX ]; then if [ $TERM == linux ]; then mocp -O ASCIILines=yes; else mocp; fi; else mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi;' # Runs mocp taking into account that the display might be bad on TMUX
alias mocmoc='if [ -z $TMUX ]; then if [ $TERM == linux ]; then exec mocp -O ASCIILines=yes; else exec mocp; fi; else exec mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi;' # Exec in moc alias
alias rec='sox -t alsa default' #permet de faire des enregistrements audio
alias dimentions='/home/maxime/Programmation/Cperso/ncurse/dimentions/quelleDimentions'
alias Off='systemctl poweroff'
alias muteMic='amixer set Capture toggle'
alias findHere='find . -name ' # Find a file in the working directory
alias nmwifi='nmcli device wifi'
alias sudo='sudo '
alias please='sudo $(fc -ln -1)'
alias lw='libreoffice --writer'
alias lc='libreoffice --calc'
alias gc='git commit -m '
alias jc='echo "javac *.java" && javac *.java'
alias power='upower -i /org/freedesktop/UPower/devices/battery_BAT0' # Display info about the battery
alias makeDebug='make 2>&1 >/dev/null | head' #On met stdout dans stderr puis on ne regarde que le début de tout ça. Cela sert à s'occuper des erreurs une à une
alias ping='/usr/bin/ping -c 5'
alias root='exec sudo su' # Makes you root and leave the shell afterward
alias analog-city='sshpass -p hightech ssh analog-city' # Connect to the analog-city SSH textboard with the password
alias copy='xclip -selection clipboard' # Put what is piped here into the X.org clipboard. Alternatively, it can be used to copy a file.
alias gpom='git push origin master' # Push the master branch to origin
alias make_verif='/usr/bin/make clean -j && /usr/bin/make -j 32 || /usr/bin/make && bell' # Runs a quick make and if there is an error, runs it slow to pinpoint where the issue is.
alias pagevim="vim -S ~/.config/vim/pager.vim -" # Runs vim as a pager reading from stdin
alias :q="exit"
alias pastable-csv='sed -e "s/,/\t/g" ' # This quick sed transform makes a csv into something pastable on Google sheet. This should be used along with the copy alias.
alias dot-to-comma='sed "s/\./\,/g"'
alias pager="$PAGER" # Run the PAGER environement variable
alias wget="wget --hsts-file=\"$XDG_DATA_HOME/wget-hsts\"" # Prevents history file to be made in the home dirrectory
alias cgrep="grep -PRI --include '*.h' --include '*.c'" # grep on C source files
alias embeter-maki="tmux attach -t (tmux ls | grep attached | head -n 1 | awk -F ':' '{print $1}')" #copies the first tmux session on the terminal
alias _giberish="head -c 80 /dev/random | base32 | head -n1 #" # Echo some noise
alias ddsync="sudo dd conv=fdatasync bs=4M status=progress" # Sane dd defaults


# Convert the file given as argument into a mp3 file
ffmpeg-to-mp3() {
    ffmpeg -i $1 -vn -ar 44100 -ac 2 -b:a 192k $1.mp3
}

# Open vim as a scratch pad. Give filetype as argument
vimtmp () {
    sufix="txt"
    if [ -n "$1" ]
    then
        sufix="$1"
    fi
	name=$(_giberish)
    name="$name.$sufix"
	vim "/tmp/$name" && rm -f -v "/tmp/$name"
}

# Open vim to write in the X clipboard
vimtype() {
	name=$(_giberish)
	vim $name && sed -z -i -e 's:\n$::' $name && copy $name && /bin/rm -f $name
}

# Open a tldr page from gemini in Amfora
agtldr() {
    prg=$1
    amfora "gemini://freeshell.de/tldr/$prg.gmi"
}



# Gère le traitement utilisé dans gted et goto. Le premier argument est la commande à lancer, le second est un argument pour find et le troisième est optionellement le dossier de départ.
GENERIC_GTED_GOTO() {
    if [ -z "$1" ]
    then
        return 2
    fi
    if [ -n "$3" ]
    then
        source=$3
    else
        source='/'
    fi
    target=$(find "$source" $2 2> /dev/null | fzf -e +m -i) #On inclu les fichiers masqués #on cherche les correspondances exactes, seules, la case ne compte pas 
    if test -n "$target"
    then
        "$1" "$target"
    else
        return 1
    fi
}

#Permet de se diriger vers un dossier ou le dossier contenant le fichier activé par fzf on peut donner un argument en entrée pour choisir le dossier de départ
goto() {
    GENERIC_GTED_GOTO cd "-type d" $1
}

#Permet de se modifier un fichier trouvé gràce à fzf. On peut donner un argument pour choisir le fichier de départ
gted() {
    GENERIC_GTED_GOTO $EDITOR "" $1
}

# Run cppckeck with all options and pipe the result into the pager
cppcheck_all() {
    cppcheck -j 20 --quiet --enable=all --suppress=unusedFunction --suppress=missingIncludeSystem $@ 2>&1 | $PAGER 
}
cppcheck_sane() {
    cppcheck -j 20 --quiet --enable=warning,information,performance --suppress=unusedFunction --suppress=missingIncludeSystem $@ 2>&1 | $PAGER 
}

# Text to speech en français
sayFR() {
    espeak "$@" -g 5 -s 130 --stdout -v fr | aplay
}

# Initialize an empty cscope database
cscope-init() {
    FILENAME=$(_giberish).c
    touch $FILENAME
    cscope -b $FILENAME 
    /bin/rm -f $FILENAME
}

make() {
    bell_and_report() {
        s=$?
        printf '\a'
        return $s
    }
    MAKE=$(which make)
    $MAKE $@; bell_and_report
}

rm() {
    if command -v rem > /dev/null
    then
        rem --rm-mode $@
    else
        rm $@
    fi
}

# Replace a name by an other in a whole directory.
rename-symbol () {
    if [ -z "$1" ] || [ -z "$2" ]
    then
        echo "Usage: rename_symbol <old symbol> <new symbol>" > /dev/stderr
        return 1
    fi
    for i in $(find *)
    do
        sed -i "s:$1:$2:g" $i
    done
}

