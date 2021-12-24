source ~/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
#antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions

# Load the theme.
antigen theme nebirhos

# Tell Antigen that you're done.
antigen apply

autoload -Uz compinit promptinit
compinit
promptinit

export LANG=ja_JP.UTF-8

export PATH=$HOME/.local/bin:$PATH
export GOPATH=$HOME/go
export PATH="$PATH:$GOPATH/bin"
export PYTHONUSERBASE=$HOME/.local

autoload -Uz colors
colors

autoload -U up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^P" up-line-or-beginning-search
bindkey "^N" down-line-or-beginning-search

bindkey -e

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=10000

# setopt
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_verify
setopt share_history
setopt nonomatch
setopt correct
setopt re_match_pcre
setopt promptsubst

# disable
disable r

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select

# alias
unalias l
unalias la
unalias ll
unalias ls
unalias lsa

if [ "$(uname)" = 'Darwin' ]; then
  alias ls='ls -v -F -G'
  alias gls='gls -v -F --color=auto'
  alias gll='gls -alh'
  alias gla='gls -A'
else
  alias ls='ls -v -F --color=auto'
  alias open='xdg-open'
  alias pbcopy='xclip -selection c'
  alias pbpaste='xclip -selection c -o'
fi
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ll='ls -alh'
alias la='ls -A'

# function
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
