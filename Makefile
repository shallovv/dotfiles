export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin

homebrew : ## homebrew settings
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	
install : ## Install packages using homebrew
	brew install bash zsh vim neovim curl wget git tmux htop ghq fzf \
		bash-completions zsh-completions zsh-syntax-highlighting

init : ## Initial deploy dotfiles
	#ln -vsf ${PWD}/.bashrc ${HOME}/.bashrc
	#ln -vsf ${PWD}/.bash_profile ${HOME}/.bash_profile
	#ln -vsf ${PWD}/.inputrc ${HOME}/.inputrc
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc
	ln -vsf ${PWD}/.vimrc ${HOME}/.vimrc
	mkdir -p ${HOME}/.config/nvim
	ln -vsf ${PWD}/.config/nvim/init.vim ${HOME}/.config/nvim/init.vim
	mkdir -p ${HOME}/.config/git
	ln -vsf ${PWD}/.config/git/ignore ${HOME}/.config/git/ignore
	ln -vsf ${PWD}/.tmux.conf ${HOME}/.tmux.conf

zsh : ## zsh settings
	brew install zsh zsh-completions zsh-syntax-highlighting
	curl -L git.io/antigen > ${HOME}/antigen.zsh
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc

git : ## git settings
	brew install git
	mkdir -p ${HOME}/.config/git
	ln -vsf ${PWD}/.config/git/ignore ${HOME}/.config/git/ignore

neovim : ## neovim settings
	brew install neovim 
	mkdir -p ${HOME}/.config/nvim
	ln -vsf ${PWD}/.config/init.vim ${HOME}/.config/init.vim
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh ~/.cache/dein
	rm -f installer.sh

neovim-dependencies : ## dependencies settings for neovim
	brew install pyenv pyenv-virtualenv rbenv node yarn
	pyenv install 2.7.18
	pyenv virtualenv 2.7.18 nvim-python2
	${HOME}/.pyenv/versions/nvim-python2/bin/pip install --upgrade pip
	${HOME}/.pyenv/versions/nvim-python2/bin/pip install pynvim neovim
	pyenv install 3.9.0 
	pyenv virtualenv 3.9.0 nvim-python3
	${HOME}/.pyenv/versions/nvim-python3/bin/pip install --upgrade pip
	${HOME}/.pyenv/versions/nvim-python3/bin/pip install pynvim neovim
	rbenv install 3.0.0
	${HOME}/.rbenv/versions/3.0.0/bin/gem install neovim
	yarn add neovim

docker : ## docker settings
	brew install docker
	brew install --cask docker
	ln -vsf /Applications/Docker.app/Contents/Resources/etc/docker.zsh-completion /usr/local/share/zsh-completions/_docker

docker-compose : ## docker-compose settings
	brew install docker-compose
	ln -vsf /Applications/Docker.app/Contents/Resources/etc/docker-compose.zsh-completion /usr/local/share/zsh-completions/_docker-compose

texlive : ## TeX Live settings
	curl -O http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/install-tl-unx.tar.gz
	tar xvf install-tl-unx.tar.gz
	sudo ./install-tl*/install-tl -no-gui -repository http://ftp.jaist.ac.jp/pub/CTAN/systems/texlive/tlnet/
	sudo mv /usr/local/share/info/dir /usr/local/share/info/dir.org
	sudo /usr/local/texlive/????/bin/*/tlmgr path add
	rm -rf install-tl-unx.tar.gz install-tl*
	ln -vsf ${PWD}/.latexmkrc ${HOME}/.latexmkrc

update : ## Update packages installed by homebrew
	brew update
	brew upgrade
	brew upgrade --cask

update_texlive : ## Update TeX Live
	sudo tlmgr update --self --all

backup_for_mac : ## Backup list of packages installed by homebrew
	mkdir -p ${PWD}/macos
	brew bundle dump -f --file=${PWD}/macos/.brewfile

backup_for_arch : ## Backup list of packages installed by pacman and yay
	mkdir -p ${PWD}/arch
	pacman -Qnq > ${PWD}/arch/pacmanlist
	pacman -Qqem > ${PWD}/arch/aurlist

allinstall : homebrew install zsh git neovim

allinit : init 

allupdate : update 

allbackup : backup

all : allinstall allinit allupdate allbackup
