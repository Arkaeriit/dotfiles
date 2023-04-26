configDir = ~/.config
dataDir = ~/.local/share
binDir = ~/.local/bin

.PHONY: save
save : saveVim saveFish saveTmux saveBash saveProfile saveSSH saveNewsboat saveGit saveOnivim2 saveAmfora saveAlacritty

.PHONY: createSaveDirs
createSaveDirs :
	mkdir -p vim fish bash tmux newsboat git onivim2 amfora

.PHONY: saveVim
saveVim : createSaveDirs
	cp -fR $(configDir)/vim/* vim/

.PHONY: saveFish
saveFish : createSaveDirs
	cp -fR $(configDir)/fish/* fish/

.PHONY: saveTmux
saveTmux : createSaveDirs
	cp -fR $(configDir)/tmux/* tmux/

.PHONY: saveBash
saveBash : createSaveDirs
	cp -fr $(configDir)/bash/* bash/

.PHONY: saveProfile
saveProfile : createSaveDirs
	cp -fr ~/.profile profile

.PHONY: saveSSH
saveSSH : createSaveDirs
	cp -fr ~/.ssh/config ssh

.PHONY: saveNewsboat
saveNewsboat : createSaveDirs
	cp -fr $(configDir)/newsboat/* newsboat/

.PHONY: saveGit
saveGit : createSaveDirs
	cp -fr $(configDir)/git/* git/

.PHONY: saveOnivim2
saveOnivim2 : createSaveDirs
	cp -f $(configDir)/oni2/configuration.json onivim2/
	cp -f $(configDir)/oni2/keybindings.json onivim2/

.PHONY: saveAmfora
saveAmfora : createSaveDirs
	cp -f $(configDir)/amfora/* amfora/

.PHONY: saveAlacritty
saveAlacritty :
	cp -f $(configDir)/alacritty.yml ./alacritty.yml

.PHONY: restore
restore : restoreVim restoreFish restoreTmux restoreBash restoreProfile restoreSSH restoreVivado restoreNewsboat restoreGit restoreOnivim2 restoreAmfora restoreAlacritty

.PHONY: restoreVim
restoreVim :
	mkdir -p $(configDir)/vim
	mkdir -p $(dataDir)/vim/swap
	mkdir -p $(dataDir)/vim/undo
	mkdir -p $(dataDir)/vim/backup
	cp -fR vim/* $(configDir)/vim/

.PHONY: restoreFish
restoreFish :
	mkdir -p $(configDir)/fish
	cp -fR fish/* $(configDir)/fish/

.PHONY: restoreTmux
restoreTmux :
	mkdir -p $(configDir)/tmux
	cp -fR tmux/* $(configDir)/tmux/

.PHONY: restoreBash
restoreBash :
	mkdir -p $(configDir)/bash
	cp -fR bash/* $(configDir)/bash/
	ln -fs $(configDir)/bash/bashrc ~/.bashrc

.PHONY: restoreProfile
restoreProfile :
	cp -f profile ~/.profile

.PHONY: restoreSSH
restoreSSH :
	cp -f ssh ~/.ssh/config

.PHONY: restoreVivado
restoreVivado :
	mkdir -p $(dataDir)/Xilinx/editor
	mkdir -p $(binDir)
	cp -f vivado/editor/* $(dataDir)/Xilinx/editor
	cp -f vivado/vivado $(binDir)/

.PHONY: restoreNewsboat
restoreNewsboat :
	mkdir -p $(configDir)/newsboat
	cp -fr newsboat/* $(configDir)/newsboat/

.PHONY: restoreGit
restoreGit :
	mkdir -p $(configDir)/git
	cp -fr git/* $(configDir)/git

.PHONY: restoreOnivim2
restoreOnivim2 :
	mkdir -p $(configDir)/oni2
	cp -f onivim2/* $(configDir)/oni2/

.PHONY: restoreAmfora
restoreAmfora :
	mkdir -p $(configDir)/amfora
	cp -f amfora/* $(configDir)/amfora/

.PHONY: restoreAlacritty
restoreAlacritty :
	mkdir -p $(configDir)
	cp -f alacritty.yml $(configDir)/alacritty.yml

.PHONY: update_branch
update_branch:
	branch=$$(git rev-parse --abbrev-ref HEAD 2> /dev/null) && \
		git checkout master && \
		git pull origin master && \
		git checkout "$$branch" && \
		git rebase master && \
		git push origin "$$branch" -f && \
		echo "Done!"

.PHONY: update_master
update_master: update_branch
	branch=$$(git rev-parse --abbrev-ref HEAD 2> /dev/null) && \
		commit=$$(git rev-parse HEAD 2> /dev/null) && \
		git checkout master && \
		git cherry-pick "$$commit" && \
		git push origin master && \
		git checkout "$$branch" && \
		git rebase master && \
		git push origin "$$branch" -f && \
		echo "Done!"

