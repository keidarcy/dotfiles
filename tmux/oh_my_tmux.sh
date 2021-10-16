# oh my tmux https://github.com/gpakosz/.tmux
cd ~
git clone https://github.com/gpakosz/.tmux.git
ln -sf ~/dotfiles/tmux/.tmux.conf.local ~/.tmux/.tmux.conf.local
ln -sf ~/.tmux/.tmux.conf.local ~/.tmux.conf.local
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf # reload tmux config
