function moc
    bash -c "if [ -z $TMUX ]; then if [ $TERM == linux ]; then mocp -O ASCIILines=yes; else mocp; fi; else mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi; $argv"
    #music player, on prend en compte que l'affichage est un peu nul dans tmux
end
