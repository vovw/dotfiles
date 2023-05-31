# # Created by Zap installer
# [ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
# plug "zsh-users/zsh-autosuggestions"
# plug "zap-zsh/supercharge"
# plug "zsh-users/zsh-syntax-highlighting"

# ALIASES
alias ls='ls --color'
alias la='ls -A'
alias pog='vim $(fzf-tmux)'
alias lsa='exa --long'
alias con="tmux attach-session -t"

# the code are the 256 color codes
# refrence here --> https://www.ditig.com/256-colors-cheat-sheet
PROMPT='%F{167}ϟ%f %B%F{240}%1~ %f%b'
# PROMPT='%F{167}∂%f %B%F{240}%1~ %f%b'


export EDITOR="nvim"
export PATH=$PATH:/Users/macbook/.local/share/zig/
# export PATH
gsl(){ git log --pretty=oneline --abbrev-commit | fzf --preview-window down:70% --preview 'echo {} | cut -f 1 -d " " | xargs git show --color=always'; }
