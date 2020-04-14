# SAY HELLO TO ZSH SETTING

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
HISTORY_IGNORE="(ls|ll|c|zshrc|update|vimrc|dotfiles|cd|pwd|exit|cd ..)"

# Basic Settings
export EDITOR=vim
#HYPHEN_INSENSITIVE="true"
#DISABLE_AUTO_UPDATE="true"
#COMPLETION_WAITING_DOTS="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"


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
#ZSH_THEME="agnoster"
#ZSH_THEME="bira"
ZSH_THEME="powerlevel10k/powerlevel10k"

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
source $BIN/local.env.z.sh 

#eval "$(anyenv init -)"
#

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
