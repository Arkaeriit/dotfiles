# Runs mocp taking into account that the display might be bad on TMUX

function moc -d "TUI music player"
    bash -c "if [ -z $TMUX ]; then if [ $TERM == linux ]; then mocp -O ASCIILines=yes; else mocp; fi; else mocp -O ASCIILines=yes -O XTermTheme=/usr/share/moc/themes/darkdot_theme -O Theme=/usr/share/moc/themes/darkdot_theme; fi; $argv"
end
