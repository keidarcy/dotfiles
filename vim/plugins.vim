filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'dracula/vim', { 'name': 'dracula' }     " dracula theme
Plugin 'drewtempelmeyer/palenight.vim'          " palenight theme
Plugin 'tpope/vim-vinegar'                      " press '-' file system
Plugin 'scrooloose/nerdtree'                    " sidebar sytem
Plugin 'preservim/nerdcommenter'                " fast comment
Plugin 'ctrlpvim/ctrlp.vim'                     " ctrl + p search file
Plugin 'vim-airline/vim-airline'                " status bar
Plugin 'tpope/vim-surround'                     " fast change surrounding quote
Plugin 'terryma/vim-multiple-cursors'           " ctrl + n select next same pattern
Plugin 'MarcWeber/vim-addon-mw-utils'           " 'vim-snipmate' independence 
Plugin 'tomtom/tlib_vim'                        " 'vim-snipmate' independence 
Plugin 'garbas/vim-snipmate'                    " snippets 
Plugin 'ervandew/supertab'
Plugin 'StanAngeloff/php.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-startify'                     " a cowsay start screen
Plugin 'ap/vim-css-color'                       " show color directly
Plugin 'vimwiki/vimwiki'                        " a personal wiki for Vim


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

