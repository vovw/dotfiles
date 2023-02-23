#!/bin/sh

export PS1="λ "
export SHEE_IGNORE_DIRS=.git:node_modules:build:.cache
export HISTFILESIZE=10000
export HISTFILE=~/.bash_history

export BROWSER="firefox"
export EDITOR="nvim"

alias comp="cd ~/Documents/kode/"
alias la="ls -A --color=auto"
alias ll="ls -lA --color=auto"
alias ls="ls --color=auto"
alias las="stat -c '%A %a %n' *"
alias ni="vim --clean"

export PF_INFO="title os host wm uptime kernel pkgs shell editor memory palette"
