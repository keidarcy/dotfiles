# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# >>>>>>>HELLO ZSH WORLD<<<<<<<<

# Completing directory stack

# DIRSTACKSIZE=100
setopt AUTO_PUSHD
setopt no_beep                  # avoid all annoying beep noise
export DEFAULT_USER="$(whoami)" # hide host and username
export LC_ALL=en_US.UTF-8       # Fix 'Warning: Failed to set locale category LC_TIME to en_JP.'

# #region history
HISTFILE=~/.zsh_history
HISTORY_IGNORE="(l[a,l,s,h,]*|c[lear]|[vim,zsh]rc|pwd|exit|cd|cd# *|z# *|e# *)"
HISTSIZE=10000
SAVEHIST=10001
# see https://zsh.sourceforge.io/Doc/Release/Options.html for detail
setopt APPEND_HISTORY         # zsh が終了した際に HISTFILE を置き換えるのではなく追記する
setopt EXTENDED_HISTORY       # HISTFILE にタイムスタンプを記録する
setopt HIST_EXPIRE_DUPS_FIRST # 重複する履歴を削除してから保存する
setopt HIST_IGNORE_ALL_DUPS   # 履歴の内容と重複する行を履歴リストに追加しない
setopt HIST_IGNORE_SPACE      # 先頭がスペースで始まる行を履歴に追加しない
setopt HIST_LEX_WORDS         # クォートされた空白を正しく取り扱う
setopt HIST_NO_STORE          # history コマンドを履歴に追加しない
setopt HIST_REDUCE_BLANKS     # 履歴に追加する際に不要な空白を取り除く
setopt HIST_SAVE_NO_DUPS      # HISTFILE に重複する履歴を保存しない
setopt HIST_VERIFY            # 履歴補完した内容を即実行せず行エディタに読み込む
setopt SHARE_HISTORY          # 複数の zsh 間で HISTFILE を共有する
#endregion history

# Basic Settings
export EDITOR=nvim
#HYPHEN_INSENSITIVE="true"
#DISABLE_AUTO_UPDATE="true"
#COMPLETION_WAITING_DOTS="true"
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# -----------------------------------------------------
# vim
bindkey -v
# https://github.com/softmoth/zsh-vim-mode#keytimeout
KEYTIMEOUT=100
# use the vi navigation keys in menu completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
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

#region zinit
#https://zdharma-continuum.github.io/zinit/wiki/
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

VI_MODE_SET_CURSOR=true # for cursor shape

zinit ice as"completion" wait lucid
zinit snippet OMZP::docker/_docker

zinit ice as"completion" wait lucid
zinit snippet OMZP::docker-compose/_docker-compose

zinit ice as"completion" wait lucid
zinit snippet OMZP::fd/_fd

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
# https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode
zinit snippet OMZP::vi-mode

zinit ice wait lucid
zinit for \
    light-mode zsh-users/zsh-autosuggestions \
    light-mode zdharma-continuum/fast-syntax-highlighting \
    light-mode romkatv/zsh-prompt-benchmark \
    light-mode zdharma-continuum/history-search-multi-word

zinit load zdharma-continuum/zui
zinit load zdharma-continuum/zbrowse

#### theme
# Load joy theme
# zinit ice depth=1 pick="jovial.zsh-theme"
# zinit light keidarcy/joy

## Load powerlevel10k theme
zinit ice depth"1" # git clone depth
zinit light romkatv/powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh # enable p10k theme

## Load starship theme
# zinit ice as"command" from"gh-r" \ # `starship` binary as command, from github release
#           atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \ # starship setup at clone(create init.zsh, completion)
#           atpull"%atclone" src"init.zsh" # pull behavior same as clone, source init.zsh
# zinit light starship/starship
# eval "$(starship init zsh)"
#### theme

# enable zsh completion system
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    if [[ $(date +'%j') != $(stat -f '%Sm' -t '%j' ~/.zcompdump) ]]; then
        # %Sm.. is for macos
        # load cached .zcompdump once a day
        compinit
    else
        compinit -C
    fi
    _comp_options+=(globdots) # Include hidden files.
fi
#endregion zinit

#region custom
# custom scripts
for file in ~/.config/zsh/*.sh; do [[ -f $file ]] && source $file; done
#endregion custom scripts

#region fzf
# fzf https://github.com/junegunn/fzf
[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh # enable fzf keybindings tab completion
export FZF_COMPLETION_TRIGGER='*'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_R_OPTS="--history=${HISTFILE} --history-size=200000"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--height 40% --layout=reverse --border
--inline-info
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff00aa,spinner:#ff87d7
'

# overrides fzf "^R" use `history-search-multi-word` "^R" shortcut
bindkey -M emacs "^R" history-search-multi-word
bindkey -M vicmd "^R" history-search-multi-word
bindkey -M viins "^R" history-search-multi-word
zstyle ":history-search-multi-word" highlight-color "fg=#5fff87,bold"
# export FZF_TMUX=1
# export FZF_TMUX_OPTS='-p50% -y10%'

#endregion fzf
