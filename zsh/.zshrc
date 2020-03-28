#####################################################
# "test zsh load items"
 #zmodload zsh/zprof # top of your .zshrc file
# Your .zshrc stuff
# zprof # bottom of .zshrc
#####################################################
# "zsh load time table"
# for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
#####################################################


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
HISTSIZE=1000
SAVEHIST=1000


# --------------Vim area------------------------------- 
# bindkey -v
# use the vi navigation keys in menu completion
zstyle ':completion:*' menu select
zmodload zsh/complist
#
# Normal mode <v> to get CLI into vim editor
#
# use the vi navigation keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
# -----------------------------------------------------

# -------------Oh-My-Zsh----------------------
ZSH_THEME="agnoster"
#ZSH_THEME="muse"

plugins=(
        git
        git-prompt
        httpie
        vi-mode
        colored-man-pages
        web-search
        # custome plugins
        zsh-completions
        zsh-autosuggestions  
        zsh-syntax-highlighting
    )
# this line fix slow paste speed caused by zsh-syntax-highlighting
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
# enable zsh-completions
# load cached .zcompdump once a day
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
  compinit
else
  compinit -C
fi
################################################


export ZSH=$HOME/.oh-my-zsh

source $ZSH/oh-my-zsh.sh

export BIN=$HOME/Code/bin

source $BIN/paths.z.sh
source $BIN/aliases.z.sh
source $BIN/functions.z.sh

source localEnv.sh

#eval "$(anyenv init -)"
#
#####################################################
# "test zsh load items"
# zmodload zsh/zprof # top of your .zshrc file
# Your .zshrc stuff
 #zprof # bottom of .zshrc
#####################################################
