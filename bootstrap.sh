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
# To install useful key bindings and fuzzy completion:
# $(brew --prefix)/opt/fzf/install #
cd zsh
brew bundle
###################################################


###################### zsh ######################
cd ..
mkdir -p ~/Code/bin
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
## install Oh-my-zsh https://github.com/ohmyzsh/ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ln -sf ~/dotfiles/zsh/aliases.z.sh ~/Code/bin/aliases.z.sh
ln -sf ~/dotfiles/zsh/functions.z.sh ~/Code/bin/functions.z.sh
ln -sf ~/dotfiles/zsh/paths.z.sh ~/Code/bin/paths.z.sh

## install zsh-user https://github.com/zsh-users
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

source ~/.zshrc
touch .hushlogin # do not show Last login: Wed Jan 01 12:00:00 on ttys01
###################################################



###################### vim ######################
# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -sf ~/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim
ln -sf ~/dotfiles/vim/plugins.vim ~/.vim/plugins.vim
# :PlugInstall # to install all plugins

mkdir -p ~/.config/nvim
ln -sf ~/.config/nvim/.vim ~/.vim
cp ~/dotfiles/vim/init.vim ~/.config/nvim/

###################################################



###################### tmux ######################
sh tmux/oh_my_tmux.sh
###################################################



###################### fonts ######################
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k
###################################################

###################### others ######################
# https://github.com/junegunn/fzf#using-homebrew
$(brew --prefix)/opt/fzf/install # config fzf
p10k configure # config powerlevel10k
###################################################
