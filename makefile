configDir = ~/.config
dataDir = ~/.local/share
binDir = ~/.local/bin

save : saveVim saveFish saveTmux saveBash saveProfile saveSSH saveNewsboat

createSaveDirs :
	mkdir -p vim fish bash tmux newsboat

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

saveSSH :
	cp -fr ~/.ssh/config ssh

saveNewsboat :
	cp -fr $(configDir)/newsboat newsboat

restore : restoreVim restoreFish restoreTmux restoreBash restoreProfile restoreSSH restoreVivado restoreNewsboat

restoreVim :
	mkdir -p $(configDir)/vim
	mkdir -p $(dataDir)/vim/swap
	mkdir -p $(dataDir)/vim/undo
	mkdir -p $(dataDir)/vim/backup
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

restoreSSH :
	cp -f ssh ~/.ssh/config

restoreVivado :
	mkdir -p $(dataDir)/Xilinx/editor
	cp -f vivado/editor/* $(dataDir)/Xilinx/editor
	cp -f vivado/vivado $(binDir)/

restoreNewsboat :
	mkdir -p $(configDir)/newsboat
	cp -fr saveNewsboat/* $(configDir)/newsboat/

