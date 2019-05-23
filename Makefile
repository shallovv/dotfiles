export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin

install : ## Install packages
	## Homebrew
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle install --file=${PWD}/.brewfile
	## TeX Live
	curl -O http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
	tar xvf install-tl-unx.tar.gz
	cd install-tl*
	sudo ./install-tl -no-gui -repository http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/
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

update : ## Update packages
	brew update
	brew upgrade
	brew cask upgrade
	sudo tlmgr update --self --all

backup : ## Backup Homebrew packages
	if [ -e .brewfile ]; then\
		rm ${PWD}/.brewfile.org;\
		mv ${PWD}/.brewfile ${PWD}/.brewfile.org;\
	fi
	brew bundle dump --file=${PWD}/.brewfile
