# Terminal Notes 

## zsh 

## when zsh becomes slow 👿, try this 🥺

### see zsh load detail

```bash
zmodload zsh/zprof # top of your .zshrc file

setopt no_beep
......

zprof # bottom of .zshrc
```

### easy quick zsh loading time benchmark

```bash
for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done
```

### `(eval):1: command not found: node`

See this [problem](https://github.com/denysdovhan/spaceship-prompt/issues/524)
`upgrade_oh_my_zsh` to update oh-my-zsh, sometimes fix some problems, 


## vim

 - <C-6> toggle from two files 2.<C-o> go back; <C-i> go forward
 - 'zz' go middle
 - change surrounding double quote to single quote cs"'
 - 'J' will take the next line below to current line
 - '.' always repeat last operation
 - mark:
   'm', any key to mark,
   then backtick the key marked bring you back
   :marks to check
 -  macros:
   'q', any key to register,
   @ + the key
   :reg to check

## tmux


