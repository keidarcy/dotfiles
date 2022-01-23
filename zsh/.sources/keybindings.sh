# CTRL-G CTRL-F for files
# CTRL-G CTRL-B for branches
# CTRL-G CTRL-T for tags
# CTRL-G CTRL-R for remotes
# CTRL-G CTRL-H for commit hashes

join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r l s
unset -f bind-git-helper

# edit alacritty.yml

open-terminal-config() { nvim ~/.config/alacritty/alacritty.yml }
zle -N open-terminal-config
bindkey '^g,' open-terminal-config
