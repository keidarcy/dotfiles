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

### Hide specific App in dock
# /usr/libexec/PlistBuddy -c 'Add :LSUIElement bool true' /Applications/[AppName].app/Contents/Info.plist

### disable spelling and Grammar
# https://apple.stackexchange.com/questions/299470/how-to-permanently-turn-off-check-spelling-while-typing-in-macos

# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# TODO: add logic for ci and local
# if mac ci
brew install stow tmux fzf alacritty
# else local mac
# brew update
# brew bundle --file=.github/Brewfile
stow --target=${HOME} git
stow --target=${HOME} zsh
stow --target=${HOME} vim
stow --target=${HOME} tmux
stow --target=${HOME} alacritty
stow --target=${HOME} hammerspoon
###################################################

###################### zsh ######################
# https://github.com/zdharma-continuum/zinit#manual-installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source ${HOME}/.zshrc
touch .hushlogin # do not show Last login: Wed Jan 01 12:00:00 on ttys01
###################################################



###################### vim ######################
# https://github.com/junegunn/vim-plug
curl -fLo ${HOME}/.vim/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
git clone https://github.com/morhetz/gruvbox.git ${HOME}/.vim/plugged/gruvbox
vim +'silent! PlugInstall' +qall
###################################################



###################### tmux ######################
# oh my tmux https://github.com/gpakosz/.tmux
# require (perl, curl, tmux, git)
git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
ln -sf ${HOME}/.tmux/.tmux.conf ~/.tmux.conf
tmux source ${HOME}/.tmux.conf
###################################################


###################### fonts ######################
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k
###################################################

###################### others ######################
# https://github.com/junegunn/fzf#using-homebrew
# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install # config fzf
# p10k configure # config powerlevel10k
###################################################