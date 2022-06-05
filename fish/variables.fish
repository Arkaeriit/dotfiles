#!/usr/bin/fish

#Définition des dossier de base
set -Ux XDG_DESKTOP_DIR "$HOME/Desktop"
set -Ux XDG_DOWNLOAD_DIR "$HOME/Downloads"
set -Ux XDG_TEMPLATES_DIR "$HOME/"
set -Ux XDG_PUBLICSHARE_DIR "$HOME/Public"
set -Ux XDG_DOCUMENTS_DIR "$HOME/Documents"
set -Ux XDG_MUSIC_DIR "$HOME/Music"
set -Ux XDG_PICTURES_DIR "$HOME/Pictures"
set -Ux XDG_VIDEOS_DIR "$HOME/Videos"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_STATE_HOME "$HOME/.local/state"

# Évite d'encombrer ~/
set -Ux ATOM_HOME "$XDG_DATA_HOME"/atom
set -Ux HISTFILE "$XDG_DATA_HOME"/bash/history
set -Ux GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -Ux GTK2_RC_FILES "$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
set -Ux ICEAUTHORITY "$XDG_CACHE_HOME"/ICEauthority
set -Ux IPYTHONDIR "$XDG_CONFIG_HOME"/jupyter
set -Ux JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
set -Ux LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set -Ux LESSHISTFILE "$XDG_CACHE_HOME"/less/history
set -Ux NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -Ux OCTAVE_HISTFILE "$XDG_CACHE_HOME/octave-hsts"
set -Ux OCTAVE_SITE_INITFILE "$XDG_CONFIG_HOME/octave/octaverc"
set -Ux WGETRC "$XDG_CONFIG_HOME/wgetrc"
set -Ux VIMINIT ":source $XDG_CONFIG_HOME"/vim/vimrc
set -Ux CARGO_HOME "$XDG_DATA_HOME"/cargo
set -Ux GNUPGHOME "$XDG_DATA_HOME"/gnupg
set -Ux GOPATH "$XDG_DATA_HOME"/go
set -Ux TERMINFO "$XDG_DATA_HOME"/terminfo
set -Ux TERMINFO_DIRS "$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
set -Ux _JAVA_OPTIONS -Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
set -Ux PYTHONSTARTUP "$XDG_CONFIG_HOME/python/pythonrc"
set -Ux RUSTUP_HOME "$XDG_DATA_HOME"/rustup
set -Ux WINEPREFIX "$XDG_DATA_HOME"/wine


# Path
set PATH $HOME/.local/bin $PATH /mnt/m.2_1/Quartus/quartus/bin $HOME/embedded-software/embedded/toolchain/arm-cortex-nano/arm-cortex-nano/bin

# Java
set -Ux JAVA_HOME /usr/lib64/jvm/java-11-openjdk-11/

# Personal charm cloud
set -Ux CHARM_HOST charm.bobignou.red

# Defaults tools
set -Ux EDITOR vim
set -Ux BROWSER firefox
set -Ux PAGER (string split " " (best-pager))

