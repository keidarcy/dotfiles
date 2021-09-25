######## functions ############

# open a set of tmux
tnew() {
    tmux new -s $1 \; split-window -v -p 20 \; split-window -h \
}


# open current folder or file in vscode 
vs ()
{
  if [[ $# -ne 0 ]]; then
      code $1
  else
      code .
  fi
}

# using ripgrep combined with preview
# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
