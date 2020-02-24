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
# agnoster customization
# customize_agnoster() {
  #prompt_segment 'cyan' 'cyan' ' 🍉'
#}
#AGNOSTER_PROMPT_SEGMENTS=("customize_agnoster" "${AGNOSTER_PROMPT_SEGMENTS[@]}")

# ZSH_THEME="powerline"
plugins=(
        git
        httpie
        vi-mode
        colored-man-pages
        #sudo
        zsh-completions
        zsh-autosuggestions  
        zsh-syntax-highlighting
    )
# ---------------------------------------------
# enable zsh-completions
autoload -U compinit && compinit

source $HOME/.path
source $ZSH/oh-my-zsh.sh
source $HOME/.functions 
source $HOME/.aliases
