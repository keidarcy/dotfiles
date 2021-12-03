join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

# CTRL-GCTRL-F for files
# CTRL-GCTRL-B for branches
# CTRL-GCTRL-T for tags
# CTRL-GCTRL-R for remotes
# CTRL-GCTRL-H for commit hashes

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t r h s
unset -f bind-git-helper
