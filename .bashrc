# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

#PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

[ -r "/etc/bashrc_$TERM_PROGRAM" ] && . "/etc/bashrc_$TERM_PROGRAM"

# git prompt
source $(brew --prefix)/etc/bash_completion.d/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true

# prompt
export PS1='\h \[\e[0;36m\]\w\[\e[0m\]$(__git_ps1 " (%s)")\n\[\e[0;32m\]\$\[\e[0m\] '

# alias
alias l='ls -lah'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls -G'
alias lsa='ls -lah'alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias vi="nvim"
alias vim="nvim"
alias cdg="__cd_ghq_list"

# function
function __cd_ghq_list() {
  local project_name=$(ghq list | sort | fzf)
  if [ -n "$project_name" ]; then
    local project_full_path=$(ghq root)/$project_name
    cd $project_full_path
  fi
}

# completion 
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi
