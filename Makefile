export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin

install : ## Install packages
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	brew bundle install --file=${PWD}/macos/.brewfile

texliveinstall : ## TeX Live
	curl -O http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
	tar xvf install-tl-unx.tar.gz
	sudo ./install-tl*/install-tl -no-gui -repository http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/
	sudo mv /usr/local/share/info/dir /usr/local/share/info/dir.org
	sudo /usr/local/texlive/????/bin/*/tlmgr path add
	rm -rf install-tl-unx.tar.gz
	rm -rf install-tl*

init : ## Initial deploy dotfiles
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.config/nvim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	ln -vsf ${PWD}/.gitignore_global ${HOME}/.gitignore_global
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf

dropboxinit : ## Initial deploy dotfiles in dropbox
	mkdir -p ${HOME}/.ssh
	ln -vsf ${HOME}/Dropbox/.zsh_history ${HOME}/.zsh_history
	ln -vsf ${HOME}/Dropbox/.ssh/config ${HOME}/.ssh/config
	# ln -vsf ${HOME}/Dropbox/.netrc ${HOME}/.netrc

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

allinit : init dropboxinit

allupdate : update texliveupdate

allbackup : backup

all : allinstall allinit allupdate allbackup
