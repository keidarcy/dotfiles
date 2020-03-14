######## functions ############

tnew() {
    tmux new -s $1 \; split-window -v -p 20 \; split-window -h \
}

nvm() {
    export NVM_DIR="$HOME/.nvm"
    echo "🚨 Lazy loading nvm..."
    # Remove nvm function
    unfunction "$0"
    # Load nvm
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    # Load bash_completion
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
    # Call nvm
    $0 "$@"
}
