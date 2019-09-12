autoload -U compinit promptinit
compinit
promptinit

export LANG=ja_JP.UTF-8

autoload -Uz colors
colors

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
LISTMAX=10000

# setopt
setopt hist_ignore_dups
setopt nonomatch
setopt correct
setopt re_match_pcre
setopt prompt_subst

# disable
disable r

# zstyle
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# path
export PATH=${HOME}/usr/bin:$PATH
export PATH=${HOME}/Library/Python/3.7/bin:$PATH

# aliase
alias ls='ls -v -F -G'
alias ll='ls -al'
alias la='ls -A'
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

## prompt
#PROMPT="%{${fg[yellow]}%}[%n@%m]%{${reset_color}%}
#%(?.%{$fg[green]%}.%{$fg[blue]%})%(?!(*'-') <!(*;-;%)? <)%{${reset_color}%} "
#PROMPT2='[%n]> '
#SPROMPT="%{$fg[red]%}%{$suggest%}(*'~'%)? < もしかして %B%r%b %{$fg[red]%}かな? [そう!(y), 違う!(n),a,e]:${reset_color} "
#
## vcs_info
#RPROMPT="%{${fg[blue]}%}[%~]%{${reset_color}%}"
#autoload -Uz vcs_info
#setopt prompt_subst
#zstyle ':vcs_info:git:*' check-for-changes true
#zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
#zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
#zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
#zstyle ':vcs_info:*' actionformats '[%b|%a]'
#precmd () { vcs_info }
#RPROMPT=$RPROMPT'${vcs_info_msg_0_}'

# prompt (https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/robbyrussell.zsh-theme)
local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT='${ret_status} %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# git (https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/git.zsh)
source /Users/shallow/src/github.com/robbyussell/oh-my-zsh/lib/git.zsh

# zsh_plugin
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
