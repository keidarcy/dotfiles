# need brew install 'coreutils' 'cowsay' 'fortune' 'lolcat'
# print colorful random cowsay every time login terminal
# for chinese version link[https://github.com/ruanyf/fortunes]
cowsay_img=$(ls /usr/local/Cellar/cowsay/3.04/share/cows/ | gshuf -n 1)
fortune -e chinese | cowsay -f $cowsay_img | lolcat
echo $cowsay_img | sed 's/.cow$//' | lolcat
date | lolcat

# avoid all annoying beep noise
setopt no_beep

# hide host and username
export DEFAULT_USER="$(whoami)"

# Completing directory stack
# DIRSTACKSIZE=100
setopt AUTO_PUSHD

# Fix 'Warning: Failed to set locale category LC_TIME to en_JP.'
export LC_ALL=en_US.UTF-8

# Set history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000


# --------------Vim area------------------------------- 
# use the vi navigation keys in menu completion
zstyle ':completion:*' menu select
zmodload zsh/complist
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# -----------------------------------------------------

# -------------Oh-My-Zsh----------------------
ZSH_THEME="agnoster"

plugins=(
        git
	vi-mode
	brew
        ripgrep
        redis-cli
        sudo
        web-search
        zsh-autosuggestions  
        zsh-syntax-highlighting
    )
# ---------------------------------------------


source $HOME/.path
source $HOME/.functions 
source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
