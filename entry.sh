#!usr/bin/env s

ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim
ln -s ~/dotfiles/vim/plugins.vim ~/.vim/plugins.vim
ln -s ~/dotfiles/tmux/.tmux.config ~/.tmux.config

mkdir -p ~/Code/bin
ln -s ~/dotfiles/zsh/aliases.z.sh ~/Code/bin/alises.z.sh
ln -s ~/dotfiles/zsh/functions.z.sh ~/Code/bin/functions.z.sh
ln -s ~/dotfiles/zsh/paths.z.sh ~/Code/bin/paths.z.sh
