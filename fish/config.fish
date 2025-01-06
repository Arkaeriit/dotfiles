#!/usr/local/bin/fish

source ~/.config/fish/variables.fish
source ~/.config/fish/setting.fish
source ~/.config/fish/startup.fish

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias .......='cd ../../../../../..'
alias ........='cd ../../../../../../..'


# pnpm
set -gx PNPM_HOME "/home/mbouillot/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
