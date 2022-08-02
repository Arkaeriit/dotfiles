# Execs the moc alias

function mocmoc -d "exec moc"
    bash -c "if [ -z $TMUX ]; then if [ $TERM == linux ]; then exec mocp -O ASCIILines=yes; else exec mocp; fi; else exec mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi; $argv"
end
