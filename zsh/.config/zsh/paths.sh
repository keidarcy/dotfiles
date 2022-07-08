export BIN=$HOME/.local/bin
export PATH=$BIN:$PATH
export PATH="/usr/local/sbin:$PATH"
export PATH="./node_modules/.bin:$PATH"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Bun
# bun completions
[ -s "/Users/yahao.xing/.bun/_bun" ] && source "/Users/yahao.xing/.bun/_bun"
export BUN_INSTALL="/Users/yahao.xing/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
