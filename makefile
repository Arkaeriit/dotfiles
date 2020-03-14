
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

restore : restoreVim restoreFish restoreTmux restoreBash

restoreVim :
	mkdir -p ~/.vim
	cp -fR vim/* ~/.vim/

restoreFish :
	mkdir -p ~/.config/fish
	cp -fR fish/* ~/.config/fish/

restoreTmux :
	mkdir -p ~/.tmux
	cp -fR tmux/* ~/.tmux/
	cp -fR tmux/.tmux.conf ~/.tmux/
	ln -fs ~/.tmux/tmux.conf ~/.tmux.conf

restoreBash :
	mkdir -p ~/.bash
	cp -fR bash/* ~/.bash/
	ln -fs ~/.bash/bashrc ~/.bashrc

