#!/usr/bin/env sh

###################### macbook ######################
# softwareupdate --install-rosetta # intall rosetta in m1 mac
# sudo xattr -r -d com.apple.quarantine /Applications/xxxxx.app # force open app

###### Apple defaults command

### dock
# defaults write com.apple.dock show-recents -bool no # set show-recents to false
# defaults write com.apple.dock recent-apps -array # intentionally empty
# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}' # add space to dock
# killall Dock # restart dock and load changes

####  ApplePressAndHoldEnabled
# defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false         # For VS Code
# defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false # For VS Code Insider
# defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false    # For VS Codium
# defaults delete -g ApplePressAndHoldEnabled                                      # If necessary, reset global default

### disable spelling and Grammar
# https://apple.stackexchange.com/questions/299470/how-to-permanently-turn-off-check-spelling-while-typing-in-macos

if [[ "$(uname -s)" == "Darwin" ]]; then
    # Install Homebrew (https://brew.sh/)
    brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    
    # TODO: add logic for ci and local
    # if mac ci
    brew install stow tmux fzf alacritty
    # else local mac
    # brew update
    # brew bundle --file=pkg/Brewfile
    # elif [[ "$(uname -s)" == "Linux" ]]; then
else
    sudo apt-get update
    sudo apt-get install stow \
    tmux \
    fzf \
    nvim \
    eza \
    zsh \
    fasd \
    ranger \
    fd-find \ # https://github.com/sharkdp/fd#on-debian
    ripgrep \
    bat
fi

#################### stow everything ###############################
stow --target=${HOME} git
stow --target=${HOME} --no-folding zsh
stow --target=${HOME} nvim
stow --target=${HOME} tmux
stow --target=${HOME} alacritty

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
git clone https://github.com/gruvbox-community/gruvbox.git ${HOME}/.vim/plugged/gruvbox
nvim +'silent! PlugInstall' +qall

###################### tmux ######################
tmux source ${HOME}/.tmux.conf


###################### others ######################
# https://github.com/junegunn/fzf#using-homebrew
# To install useful key bindings and fuzzy completion:
if [[ "$(uname -s)" == "Darwin" ]]; then
    $(brew --prefix)/opt/fzf/install # config fzf
else
    # install fzf
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
fi
# p10k configure # config powerlevel10k

############### fonts ##################
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k
