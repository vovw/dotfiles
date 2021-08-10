#!/bin/sh



export PS1="➜ "

export SHEE_IGNORE_DIRS=.git:node_modules:build:.cache
export HISTFILESIZE=10000
export HISTFILE=~/.bash_history

export BROWSER="firefox"
export EDITOR="nvim"

alias la="ls -A --color=auto"
alias ls='ls --color=auto'
alias las="stat -c '%A %a %n' *"
alias vi="nvim"
alias music="mpv --loop-playlist --shuffle /home/voidz/Music/mcvirgins/mc_virgins-forever_virgins(2019).opus"

export PF_INFO="title os host wm uptime kernel pkgs shell editor memory palette"
