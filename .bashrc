#!/bin/sh

Red="$(tput bold)$(tput setaf 1)"      # Red
Yellow="$(tput bold)$(tput setaf 3)"   # Yellow
export PS1='\[$Red\]♥ \[$Red\]\W \[$Yellow\]\$\[\e[0m\] '

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
