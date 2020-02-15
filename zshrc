export DEFAULT_USER="$(whoami)"
setopt no_beep
setopt AUTO_PUSHD
# resolve 'Warning: Failed to set locale category LC_TIME to en_JP.'
export LC_ALL=en_US.UTF-8

# set history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

ZSH_THEME="agnoster"

plugins=(git
	vi-mode
	copyfile
	brew
        ripgrep
        redis-cli
        sudo
        web-search
    )

source $HOME/.path
source $HOME/.functions
source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
# need brew install 'coreutils' 'cowsay' 'fortune' 'lolcat'
# print colorful random cowsay every time login terminal
cowsay_img=$(ls /usr/local/Cellar/cowsay/3.04/share/cows/ | gshuf -n 1)
date | cowsay -f $cowsay_img | lolcat
echo $cowsay_img | sed 's/.cow$//' | lolcat
