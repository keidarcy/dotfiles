!usr/bin/env s

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


# vim

ln -s ~/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim
ln -s ~/dotfiles/vim/plugins.vim ~/.vim/plugins.vim


# tmux
# oh my tmux https://github.com/gpakosz/.tmux
ln -s ~/dotfiles/tmux/.tmux.conf.local ~/.tmux/.tmux.conf.localn -s ~/dotfiles/zsh/paths.z.sh ~/Code/bin/paths.z.sh
