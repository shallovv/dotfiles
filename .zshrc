autoload -U compinit promptinit
compinit
promptinit

export LANG=ja_JP.UTF-8

autoload -Uz colors
colors

# History
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=10000

# setopt
setopt hist_ignore_dups
setopt nonomatch
setopt correct
#setopt re_match_pcre
setopt prompt_subst

# disable
disable r

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# Alias
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -v -F -G'
alias ll='ls -alh'
alias la='ls -A'

# Function
function __cd_ghq_list() {
  local project_name=$(ghq list | sort | fzf)
  if [ -n "$project_name" ]; then
    local project_full_path=$(ghq root)/$project_name
    BUFFER="cd $project_full_path"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N __cd_ghq_list
bindkey '^]' __cd_ghq_list

# Completions
if [ -e /usr/local/share/zsh-completions ]; then
	fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

## Oh My Zsh Settings
ZSH_THEME="robbyrussell"

## Zinit Settings
# Must Load OMZ Git Library
zinit snippet OMZL::git.zsh

# Load Git plugin from OMZ
#zinit snippet OMZP::git
zinit cdclear -q

setopt promptsubst

# Load Prompt
zinit snippet OMZT::robbyrussell
