" https://github.com/vscode-neovim/vscode-neovim#conditional-initvim
function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'name': 'dracula' }                     " dracula theme
Plug 'w0ng/vim-hybrid'                                        " A dark color scheme for Vim
Plug 'drewtempelmeyer/palenight.vim'                          " palenight theme
Plug 'morhetz/gruvbox'                                        " gruvbox theme
Plug 'tpope/vim-vinegar'                                      " press '-' file system
Plug 'scrooloose/nerdtree'                                    " sidebar sytem
Plug 'tpope/vim-commentary'                                   " fast comment
Plug 'vim-airline/vim-airline'                                " status bar
Plug 'vim-airline/vim-airline-themes'                         " A collection of themes for vim-airline
Plug 'tpope/vim-surround'                                     " fast change surrounding quote
Plug 'terryma/vim-multiple-cursors'                           " ctrl + n select next same pattern
Plug 'dense-analysis/ale', Cond(!exists('g:vscode'))          " Check syntax in Vim asynchronously and fix files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                       " Things you can do with fzf and Vim
Plug 'itchyny/vim-cursorword'                                 " Underlines the word under the cursor
Plug 'lfv89/vim-interestingwords'                             " A vim plugin for highlighting and navigating words
Plug 'ervandew/supertab'                                      " Perform all your vim insert mode completions with Tab
Plug 'tpope/vim-fugitive'                                     " Git inside vim, like :Gcommit
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'                                        " A git commit browser in Vim
Plug 'ap/vim-css-color'                                       " show color directly
Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})               " Intellisense engine
" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

call plug#end()
