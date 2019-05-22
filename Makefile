export PATH := /bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin

install : ## Install Homebrew and packages
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew bundle install --file=${PWD}/.brewfile

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

backup : ## Backup Homebrew packages
	brew bundle dump --file=${PWD}/.brewfile
