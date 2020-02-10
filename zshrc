export DEFAULT_USER="$(whoami)"
setopt no_beep
setopt AUTO_PUSHD

HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

ZSH_THEME="agnoster"

plugins=(git
	vi-mode
	copyfile
	brew
        ripgrep
        sublime
        redis-cli
        sudo
        vscode
        web-search
        command-not-found
    )

source $HOME/.path
source $HOME/.functions
source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/xyh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/xyh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/xyh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/xyh/google-cloud-sdk/completion.zsh.inc'; fi

