# >>>>>>>HELLO ZSH WORLD<<<<<<<<

## p10k instant prompt to avoid latency of .zshrc load
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


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
export HISTSIZE=1000
export SAVEHIST=10001
HISTORY_IGNORE="(l[a,l,s,h,]*|c[lear]|[vim,zsh]rc|pwd|exit|cd|cd *|z)"

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
        docker
        docker-compose
        vi-mode
        colored-man-pages
        # custome plugins
        zsh-completions
        zsh-autosuggestions
        zsh-syntax-highlighting
    )
# this line fix slow paste speed caused by zsh-syntax-highlighting
zstyle ':bracketed-paste-magic' active-widgets '.self-*'
# enable zsh completion system
autoload -Uz compinit
if [ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]; then
# load cached .zcompdump once a day
  compinit
else
  compinit -C
fi
# -------------Oh-My-Zsh----------------------


export ZSH=$HOME/.oh-my-zsh
export BIN=$HOME/.homebin
export VOLTA_HOME="$HOME/.volta"

[[ -f $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh
for file in ~/dotfiles/zsh/.sources/*.sh; do source $file; done
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh



# --------------Tools----------------------
#
#
# -------- fzf https://github.com/junegunn/fzf
#
export FZF_COMPLETION_TRIGGER='*'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--height 40% --layout=reverse --border
--inline-info
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p50% -y10%'

# https://github.com/wfxr/forgit#-installation
# source <(curl -sSL git.io/forgit)

# --------- fasd https://github.com/clvv/fasd
# eval "$(fasd --init auto)"


# --------- cht.sh https://github.com/chubin/cheat.sh#zsh-tab-completion
# echo 'fpath=(~/.zsh.d/ $fpath)' >> ~/.zshrc
# --------------Tools----------------------
#

# tabtab source for packages
# uninstall by removing these lines
# [[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
