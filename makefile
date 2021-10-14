configDir = ~/.config
dataDir = ~/.local/share
binDir = ~/.local/bin

save : saveVim saveFish saveTmux saveBash saveProfile saveSSH saveNewsboat saveGit saveOnivim2 saveAmfora saveAlacritty

.PHONY : createSaveDirs 
createSaveDirs :
	mkdir -p vim fish bash tmux newsboat git onivim2 amfora

saveVim : createSaveDirs
	cp -fR $(configDir)/vim/* vim/

saveFish : createSaveDirs
	cp -fR $(configDir)/fish/* fish/

saveTmux : createSaveDirs
	cp -fR $(configDir)/tmux/* tmux/

saveBash : createSaveDirs
	cp -fr $(configDir)/bash/* bash/

saveProfile : createSaveDirs
	cp -fr ~/.profile profile

saveSSH : createSaveDirs
	cp -fr ~/.ssh/config ssh

saveNewsboat : createSaveDirs
	cp -fr $(configDir)/newsboat/* newsboat/

saveGit : createSaveDirs
	cp -fr $(configDir)/git/* git/

saveOnivim2 : createSaveDirs
	cp -f $(configDir)/oni2/configuration.json onivim2/
	cp -f $(configDir)/oni2/keybindings.json onivim2/

saveAmfora : createSaveDirs
	cp -f $(configDir)/amfora/* amfora/

saveAlacritty :
	cp -f $(configDir)/alacritty.yml ./alacritty.yml

restore : restoreVim restoreFish restoreTmux restoreBash restoreProfile restoreSSH restoreVivado restoreNewsboat restoreGit restoreOnivim2 restoreAmfora restoreAlacritty

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


restoreNewsboat :
	mkdir -p $(configDir)/newsboat
	cp -fr newsboat/* $(configDir)/newsboat/

restoreGit :
	mkdir -p $(configDir)/git
	cp -fr git/* $(configDir)/git

restoreOnivim2 :
	mkdir -p $(configDir)/oni2
	cp -f onivim2/* $(configDir)/oni2/

restoreAmfora :
	mkdir -p $(configDir)/amfora
	cp -f amfora/* $(configDir)/amfora/

restoreAlacritty :
	mkdir -p $(configDir)
	cp -f alacritty.yml $(configDir)/alacritty.yml

