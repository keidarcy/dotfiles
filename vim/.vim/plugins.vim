" https://github.com/vscode-neovim/vscode-neovim#conditional-initvim
function! Cond(Cond, ...)
  let opts = get(a:000, 0, {})
  return a:Cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction


call plug#begin('~/.vim/plugged')

" appearance
Plug 'gruvbox-community/gruvbox'                                        " gruvbox theme
Plug 'vim-airline/vim-airline'                                " status bar
Plug 'vim-airline/vim-airline-themes'                         " A collection of themes for vim-airline
Plug 'itchyny/vim-cursorword'                                 " Underlines the word under the cursor
Plug 'lfv89/vim-interestingwords'                             " A vim plugin for highlighting and navigating words
Plug 'ap/vim-css-color'                                       " show color directly

" functionality
Plug 'tpope/vim-vinegar'                                      " press '-' file system
Plug 'scrooloose/nerdtree'                                    " sidebar sytem
Plug 'tpope/vim-commentary'                                   " fast comment
Plug 'tpope/vim-surround'                                     " fast change surrounding quote
Plug 'terryma/vim-multiple-cursors'                           " ctrl + n select next same pattern
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'                                       " Things you can do with fzf and Vim
" Plug 'tpope/vim-fugitive'                                     " Git inside vim, like :Gcommit
" Plug 'junegunn/gv.vim'                                        " A git commit browser in Vim
" Plug 'airblade/vim-gitgutter'
"
"
" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

call plug#end()
