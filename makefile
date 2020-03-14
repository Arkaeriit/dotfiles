
save : saveVim saveFish saveTmux saveBash

saveVim :
	cp -fR ~/.vim/* vim/

saveFish :
	cp -fR ~/.config/fish/* fish/

saveTmux :
	cp -fR ~/.tmux/* tmux/
	cp -fR ~/.tmux.conf tmux/

saveBash :
	cp -fr ~/.bash/* bash/

