#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vi="nvim"
alias vim="nvim"
alias cdfzf="cd \$(find . -type d | fzf)"

PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\u@\h \[\e[91m\]${PS1_CMD1}\[\e[0m\] \[\e[94m\]\w\[\e[0m\] \[\e[93m\]>\[\e[0m\] '

EDITOR="nvim"
