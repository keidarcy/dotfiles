#!/usr/bin/env sh

if [[ "$(uname -s)" == "Darwin" ]]; then
    sh ./macos.sh
    elif [[ "$(uname -s)" == "Linux" ]]; then
    echo "Linux"
fi

# stow all folders
stow --target=${HOME} */

###################### zsh ######################
# https://github.com/zdharma-continuum/zinit#manual-installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source ${HOME}/.zshrc
touch .hushlogin # do not show Last login: Wed Jan 01 12:00:00 on ttys01


###################### vim ######################
# https://github.com/junegunn/vim-plug
curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/morhetz/gruvbox.git ${HOME}/.vim/plugged/gruvbox
vim +'silent! PlugInstall' +qall


###################### tmux ######################
tmux source ${HOME}/.tmux.conf


###################### others ######################

####### fonts ######
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k