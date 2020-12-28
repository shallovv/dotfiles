export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin

homebrew : ## homebrew settings
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	
install : ## Install packages using homebrew
	brew install bash zsh vim neovim curl wget git tmux htop ghq fzf \
		bash-completions zsh-completions zsh-syntax-highlighting

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

zsh : ## zsh settings
	brew install zsh zsh-completions zsh-syntax-highlighting
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	curl -o ${HOME}/.oh-my-zsh/custom/themes/2-line-robbyrussell.zsh-theme https://gist.githubusercontent.com/shallovv/72d591186f87cc8e44e14449db85e831/raw/856ac8eb61601dfdb73d48a714a0d8066f65ea07/2-line-robbyrussell.zsh-theme
	ln -vsf ${PWD}/.zshrc ${HOME}/.zshrc

git : ## git settings
	brew install git
	ln -vsf ${PWD}/.gitignore_global ${HOME}/.gitignore_global
	git config --global core.excludesFile ${HOME}/.gitignore_global
	brew tap microsoft/git
	brew install --cask git-credential-manager-core

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
	rm -rf install-tl-unx.tar.gz
	rm -rf install-tl*
	ln -vsf ${PWD}/.latexmkrc ${HOME}/.latexmkrc

update : ## Update packages installed by homebrew
	brew update
	brew upgrade
	brew upgrade --cask

texliveupdate : ## Update TeX Live
	sudo tlmgr update --self --all

backup : ## Backup list of packages installed by homebrew
	mkdir -p ${PWD}/macos
	brew bundle dump -f --file=${PWD}/macos/.brewfile

allinstall : homebrew install zsh git texlive

allinit : init 

allupdate : update texliveupdate

allbackup : backup

all : allinstall allinit allupdate allbackup
