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
Plug 'easymotion/vim-easymotion'                              " Move cursor fast
Plug 'dense-analysis/ale'                                     " Check syntax in Vim asynchronously and fix files
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                       " Things you can do with fzf and Vim
Plug 'itchyny/vim-cursorword'                                 " Underlines the word under the cursor
Plug 'lfv89/vim-interestingwords'                             " A vim plugin for highlighting and navigating words
Plug 'itchyny/calendar.vim'                                   " A calendar application for Vim
Plug 'ervandew/supertab'                                      " Perform all your vim insert mode completions with Tab
" Plug 'StanAngeloff/php.vim'                                   " PHP
Plug 'fatih/vim-go'                                           " Golang
Plug 'pangloss/vim-javascript'                                " Js
Plug 'tpope/vim-fugitive'                                     " Git inside vim, like :Gcommit
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/gv.vim'                                        " A git commit browser in Vim
Plug 'mhinz/vim-startify'                                     " a cowsay start screen
Plug 'ap/vim-css-color'                                       " show color directly
Plug 'neoclide/coc.nvim', {'branch': 'release'}               " Intellisense engine
" Plug 'MarcWeber/vim-addon-mw-utils'                           " 'vim-snipmate' independence
" Plug 'tomtom/tlib_vim'                                        " 'vim-snipmate' independence
" Plug 'garbas/vim-snipmate'                                    " snippets
" Plug 'Yggdroot/indentLine'                                    " A vim plugin to display the indention levels with thin vertical lines

call plug#end()
