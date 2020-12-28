export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin

install : ## Install packages
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew install bash zsh vim neovim curl wget git tmux htop ghq fzf

texliveinstall : ## TeX Live
	curl -O http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
	tar xvf install-tl-unx.tar.gz
	sudo ./install-tl*/install-tl -no-gui -repository http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/
	sudo mv /usr/local/share/info/dir /usr/local/share/info/dir.org
	sudo /usr/local/texlive/????/bin/*/tlmgr path add
	rm -rf install-tl-unx.tar.gz
	rm -rf install-tl*

init : ## Initial deploy dotfiles
	ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
	ln -vsf ${PWD}/.bash_profile ${HOME}/.bash_profile
	ln -vsf ${PWD}/.inputrc ${HOME}/.inputrc
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.config/nvim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsf ${PWD}/.gitignore_global ${HOME}/.gitignore_global
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf
	ln -vsf ${PWD}/.latexmkrc ${HOME}/.latexmkrc

update : ## Update packages
	brew update
	brew upgrade
	brew cask upgrade

texliveupdate : ## Update TeX Live
	sudo tlmgr update --self --all

backup : ## Backup Homebrew packages
	mkdir -p ${PWD}/macos
	brew bundle dump -f --file=${PWD}/macos/.brewfile

allinstall : install texliveinstall

allinit : init 

allupdate : update texliveupdate

allbackup : backup

all : allinstall allinit allupdate allbackup
