export BIN=$HOME/.local/bin
export PATH=$BIN:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.atuin/bin:$PATH"
export PATH="$HOME/Library/Python/3.9/bin/:$PATH"

# Bun
# bun completions
[ -s '$HOME/.bun/_bun' ] && source '$HOME/.bun/_bun'
export BUN_INSTALL="/Users/yahao.xing/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#
# golang
export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GO111MODULE=on

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
