configDir = ~/.config

save : saveVim saveFish saveTmux saveBash saveProfile

createSaveDirs :
	mkdir -p vim fish bash tmux

saveVim :
	cp -fR $(configDir)/vim/* vim/

saveFish :
	cp -fR $(configDir)/fish/* fish/

saveTmux :
	cp -fR $(configDir)/tmux/* tmux/

saveBash :
	cp -fr $(configDir)/bash/* bash/

saveProfile :
	cp -fr ~/.profile profile

restore : restoreVim restoreFish restoreTmux restoreBash restoreProfile

restoreVim :
	mkdir -p $(configDir)/vim
	cp -fR vim/* $(configDir)/vim/

restoreFish :
	mkdir -p $(configDir)/fish
	cp -fR fish/* $(configDir)/fish/

restoreTmux :
	mkdir -p $(configDir)/tmux
	cp -fR tmux/* $(configDir)/tmux/

restoreBash :
	mkdir -p $(configDir)/bash
	cp -fR bash/* $(configDir)/bash/
	ln -fs $(configDir)/bash/bashrc ~/.bashrc

restoreProfile :
	cp -f profile ~/.profile

