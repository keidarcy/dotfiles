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

# Install Homebrew (https://brew.sh/)
brew help || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
# ./pkg/Brewfile
brew bundle --file=pkg/Brewfile
###################################################


###################### zsh ######################
stow zsh
# https://github.com/zdharma-continuum/zinit#manual-installation
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
mkdir -p "$(dirname $ZINIT_HOME)"
git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source ~/.zshrc
touch .hushlogin # do not show Last login: Wed Jan 01 12:00:00 on ttys01
###################################################



###################### vim ######################
# install Vundle
stow vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
###################################################



###################### tmux ######################
# oh my tmux https://github.com/gpakosz/.tmux
# require (perl, curl, tmux, git)
stow tmux
git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
###################################################



###################### fonts ######################
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k
###################################################

###################### others ######################
# https://github.com/junegunn/fzf#using-homebrew
# To install useful key bindings and fuzzy completion:
stow git
$(brew --prefix)/opt/fzf/install # config fzf
p10k configure # config powerlevel10k
###################################################
