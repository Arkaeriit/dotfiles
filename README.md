# Arkaeriit's dotfiles

This repository contains the configuration files I use for a bunch of different softwares. The git workflow and the management of those files is assisted with a makefile.

## File managements

This repository contains a copy of the system's file. To copy the files from this repository on the system, do `make restore`. To copy the files from the system in this repository, do `make save`. Some scripts are used to download stuff that is not in this repository such as vim plugins. To run those scrips, run `make scripts`.

The shells use `z.lua` for navigation, you can install Lua with the script `fish/z/get-lua.fish`.

## Git workflow

The configuration files are used between all my machines and each machine might need so slight tweaks. To manage that, each machine have its own git branch.

Each modification is made in commits. Those commits can be either changes that should only be applied to a single machine. In which case they are prefixed with `[LOCAL]` in the commit messages and they should only be in a machine branch. They can also be made for all machines. In which case they are prefixed with `[GLOBAL]` and should be put on the master branch.

Global changes should be cherry-picked on master and the machine branch should be then rebased on top of the master branch. This action is performed automatically when doing `make update_master`. To rebase a machine branch on top of the master branch and get the latest global commits, do `make update_branch`.

## License

Everything I wrote in this repository in under the public domain. I also incorporated here the program `z.lua` written by skywind and licensed under MIT license.

