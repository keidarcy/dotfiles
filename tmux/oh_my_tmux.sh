# oh my tmux https://github.com/gpakosz/.tmux
tmux_config_local='.tmux.conf.local'

cd ~
git clone https://github.com/gpakosz/.tmux.git
[ -f ~/dotfiles/tmux/$tmux_config_local ] && ln -sf ~/dotfiles/tmux/$tmux_config_local ~/.tmux/$tmux_config_local
ln -sf ~/.tmux/$tmux_config_local ~/$tmux_config_local 0
ln -sf ~/.tmux/.tmux.conf ~/.tmux.conf
tmux source-file ~/.tmux.conf # reload tmux config
