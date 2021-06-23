# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
# Prompt
#PS1='\w ➜ '
#eval "$(starship init bash)"

# stuff
# alias  loadx="xrdb -merge ~/.Xresources"

# Defaults
export EDITOR="vim"
export VISUAL="$EDITOR"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'


export TERM=xterm-256color

#alias
alias vi='nvim'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

#stuff for browser
alias discord+='chromium --app=https://discord.com/channels/@me'
alias spotify='chromium --app=https://open.spotify.com'
alias wefetch="curl -s wttr.in/Quito | sed -n 2,7p"
alias zoomzoom='eat flatpak run us.zoom.Zoom'

#pfetch settings
export PF_ASCII="linux"
pfetch


