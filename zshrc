export DEFAULT_USER="$(whoami)"
setopt no_beep

export ZSH="/Users/xyh/.oh-my-zsh"
export PATH=/Users/xyh/Code/tools/flutter/bin/:$PATH
export PATH="/Users/xyh/.composer/vendor/bin:$PATH" 
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

ZSH_THEME="agnoster"

plugins=(git
	vi-mode
	brew)

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/xyh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/xyh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/xyh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/xyh/google-cloud-sdk/completion.zsh.inc'; fi

