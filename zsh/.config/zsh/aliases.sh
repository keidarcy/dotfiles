# Vim
alias e='nvim'

# Easier navigation
alias ~="cd ~"
alias ..="cd .."
alias ..\/="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ls - exa
# https://github.com/ogham/exa#command-line-options
alias ls='exa'
alias l='exa -lhF'
alias ll='exa -lahF --git --icons'
alias la='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all extended list
alias tree='exa --tree --level=3'


# Git Stuff
alias gs='git status'
alias gd='git diff'
alias gsb='git status -sb'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit -m'
alias gco='git checkout'
alias gac='gaa && git commit -a -m'
alias gp='git push'
alias nah='git reset --hard;git clean -df;'
alias gll='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold #008080)<%an>%Creset %C(bold blue)<%ae>%Creset'\'
alias glla='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --all'
alias glls='git log --graph --pretty='\''%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'\'' --stat'

# tmux
alias t='tmux'
alias tn='tmux new-session -A -s main'
alias ta='tmux attach -t'
alias td='tmux detach'
alias tl='tmux list-sessions'
alias tks='tmux kill-session -t'
alias tkw='tmux kill-window -t'
alias tkp='tmux kill-pane -t'
alias tkserver='tmux kill-server'

# System
alias h='history'
alias c='clear'
alias ra='ranger'
alias mkdir='mkdir -p'
alias zshrc='e ~/.zshrc'
alias vimrc='e ~/.vimrc'
alias update='source ~/.zshrc'
alias udpate='update'
alias dirsize='du -sh'
alias subdirsize='du -h -d 1 | sort -hr'
alias myip='curl ipinfo.io/ip'
alias mypath='echo $PATH | tr -s ':' '\n''
alias myport='lsof -nP +c 150 | grep LISTEN'
alias sed='gsed' # overwrite macos sed to `brew install gnu-sed` /usr/bin/sed
alias awk='gawk'


alias when-c='when-changed -r -v -1 . '
