#!/usr/bin/env sh

###################### macbook ######################
# softwareupdate --install-rosetta # intall rosetta in m1 mac
# sudo xattr -r -d com.apple.quarantine /Applications/xxxxx.app # force open app
###### dock
# defaults write com.apple.dock show-recents -bool no # set show-recents to false
# defaults write com.apple.dock recent-apps -array # intentionally empty
# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}' # add space to dock
# killall Dock # restart dock and load changes
sh ./src/brew.install.sh
###################################################


###################### zsh ######################
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

## install nvm https://github.com/nvm-sh/nvm#git-install
# ln -sf ~/dotfiles/zsh/.nvmrc ~/.nvmrc
# git clone https://github.com/nvm-sh/nvm.git .nvm
# git checkout v0.38.0
# . ./nvm.sh

# source ~/.zshrc
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
# oh my tmux https://github.com/gpakosz/.tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -sf ~/dotfiles/tmux/.tmux.conf.local ~/.tmux/.tmux.conf.local
ln -sf ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf # reload tmux config
# ln -s ~/dotfiles/zsh/paths.z.sh ~/Code/bin/paths.z.sh
###################################################



###################### fonts ######################
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k
###################################################
