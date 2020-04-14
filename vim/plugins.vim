" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim', { 'name': 'dracula' }     " dracula theme
Plug 'drewtempelmeyer/palenight.vim'          " palenight theme
Plug 'tpope/vim-vinegar'                      " press '-' file system
Plug 'scrooloose/nerdtree'                    " sidebar sytem
Plug 'tpope/vim-commentary'                   " fast comment
Plug 'ctrlpvim/ctrlp.vim'                     " ctrl + p search file
Plug 'vim-airline/vim-airline'                " status bar
Plug 'tpope/vim-surround'                     " fast change surrounding quote
Plug 'terryma/vim-multiple-cursors'           " ctrl + n select next same pattern
Plug 'MarcWeber/vim-addon-mw-utils'           " 'vim-snipmate' independence 
Plug 'tomtom/tlib_vim'                        " 'vim-snipmate' independence 
Plug 'garbas/vim-snipmate'                    " snippets 
Plug 'easymotion/vim-easymotion'              " Move cursor fast
Plug 'dense-analysis/ale'                     " Check syntax in Vim asynchronously and fix files
Plug 'junegunn/fzf.vim'                       " Things you can do with fzf and Vim
Plug 'itchyny/vim-cursorword'                 " Underlines the word under the cursor
Plug 'lfv89/vim-interestingwords'             " A vim plugin for highlighting and navigating words
Plug 'itchyny/calendar.vim'                   " A calendar application for Vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense engine
Plug 'ervandew/supertab'
Plug 'StanAngeloff/php.vim'                   " PHP
Plug 'fatih/vim-go'                           " Golang
Plug 'pangloss/vim-javascript'                " Js
Plug 'tpope/vim-fugitive'                     " Git inside vim, like :Gcommit
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'                     " a cowsay start screen
Plug 'ap/vim-css-color'                       " show color directly
Plug 'vimwiki/vimwiki'                        " a personal wiki for Vim


call plug#end()
" All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required

