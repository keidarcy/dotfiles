!usr/bin/env sh

source ./src/brew.install.sh

mkdir -p ~/Code/bin

# zsh
# Oh-my-zsh https://github.com/ohmyzsh/ohmyzsh
# zsh-user https://github.com/zsh-users
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc

ln -s ~/dotfiles/zsh/aliases.z.sh ~/Code/bin/alises.z.sh
ln -s ~/dotfiles/zsh/functions.z.sh ~/Code/bin/functions.z.sh
ln -s ~/dotfiles/zsh/paths.z.sh ~/Code/bin/paths.z.sh

git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# vim
# install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim
ln -s ~/dotfiles/vim/plugins.vim ~/.vim/plugins.vim

# tmux
# oh my tmux https://github.com/gpakosz/.tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -sf ~/dotfiles/tmux/.tmux.conf.local ~/.tmux/.tmux.conf.local
ln -sf ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf # reload tmux config

# ln -s ~/dotfiles/zsh/paths.z.sh ~/Code/bin/paths.z.sh


# Fonts
###########################################
# Fira Code https://github.com/tonsky/FiraCode
# Meslo Nerd Font https://github.com/romkatv/powerlevel10k
###########################################


# mac tips

# softwareupdate --install-rosetta # intall rosetta in m1 mac
# sudo xattr -r -d com.apple.quarantine /Applications/xxxxx.app # force open app
###### dock
# defaults write com.apple.dock show-recents -bool no # set show-recents to false
# defaults write com.apple.dock recent-apps -array # intentionally empty
# defaults write com.apple.dock persistent-others -array-add '{tile-data={}; tile-type="spacer-tile";}' # add space to dock
# killall Dock # restart dock and load changes
