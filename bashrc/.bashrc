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

PS1='\[\e[32m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]\\$ '

EDITOR="nvim"
