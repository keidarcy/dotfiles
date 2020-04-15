" __   ____     ____     ________      _______ __  __ _____   _____ 
" \ \ / /\ \   / /\ \   / / __ \ \    / /_   _|  \/  |  __ \ / ____|
"  \ V /  \ \_/ /  \ \_/ / |  | \ \  / /  | | | \  / | |__) | |     
"   > <    \   /    \   /| |  | |\ \/ /   | | | |\/| |  _  /| |     
"  / . \    | |      | | | |__| | \  /   _| |_| |  | | | \ \| |____ 
" /_/ \_\   |_|      |_|  \____/   \/   |_____|_|  |_|_|  \_\\_____|
" 
" Author: @xyh
" Github: https://github.com/xyyolab/dotfiles
                                                                  
                                                                  
set nocompatible                        "We want the latest Vim settings/options.

syntax enable

so ~/.vim/plugins.vim
"-------------------------------General Setting------------------------------------------"

set backspace=indent,eol,start          "Make backspace behave like every other editor.
set relativenumber "se rnu              "Let's activate line numbers.
set noerrorbells visualbell t_vb=	"No bell!
set autowriteall                        "Automatically write the file when switching buffers.
set complete=.,w,b,u                    "Set our desired autocompletion matching.
set tabstop=8                           " tab, space, next line etc
set expandtab                           " tab, space, next line etc
set softtabstop=4                       " tab, space, next line etc
set shiftwidth=4                        " tab, space, next line etc,
set clipboard=unnamed                   "Mac OS X clipboard sharing

"---------------Visuals-------------"
set background=dark                     " dark,light
set t_CO=256                            "Use 256 colors. This is useful for Terminal Vim.
"------Gui Setting for macvim-------"
set guifont=Fira_Code:h17		"Set the default font family and size.
set guioptions-=e
set linespace=15                        "Not work in terminal vim.
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"------Basic Setting---------------"
" vim-plug Automatic installation 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = ','                     "The default leader is \, but a comma is better. 
"let g:palenight_terminal_italics=1
"colorscheme palenight                    "darcula, solarized, molokai, palenight
let g:terminal_color_0  = '#000000'     "manual darcula
let g:terminal_color_1  = '#FF5555'
let g:terminal_color_2  = '#50FA7B'
let g:terminal_color_3  = '#F1FA8C'
let g:terminal_color_4  = '#BD93F9'
let g:terminal_color_5  = '#FF79C6'
let g:terminal_color_6  = '#8BE9FD'
let g:terminal_color_7  = '#BFBFBF'
let g:terminal_color_8  = '#4D4D4D'
let g:terminal_color_9  = '#FF6E67'
let g:terminal_color_10 = '#5AF78E'
let g:terminal_color_11 = '#F4F99D'
let g:terminal_color_12 = '#CAA9FA'
let g:terminal_color_13 = '#FF92D0'
let g:terminal_color_14 = '#9AEDFE'
"------Background Color------------"
set foldcolumn=0                        
" hi LineNr ctermfg=bg ctermbg=bg         " tweak color. fake a custom left padding 
" hi foldcolumn ctermbg=bg                      " hi means highlight
" hi vertsplit ctermfg=bg ctermbg=bg
hi NonText ctermfg=gray guifg=grey10

"---------------Search-------------"
set hlsearch
set incsearch

"-------------------------------Window Management--------------------------"
" window control prefix
nnoremap  [Window]   <Nop>
nmap      s [Window]

" sv, sg to splite window in normal mode
nnoremap <silent> [Window]p  :<C-u>split<CR>
nnoremap <silent> [Window]v  :<C-u>vsplit<CR>

"---------------Window Split---------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"---------------Window Switch---------"
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l


"---------------Resize Management---------"
nmap <C-J><C-J> <C-W>- 
nmap <C-K><C-K> <C-W>+
nmap <C-H><C-H> <C-W><
nmap <C-L><C-L> <C-W>>

"-------------------------------Window Management--------------------------"



"-------------------------------Key Binding--------------------------------"

" map Esc to jj 
imap jj <Esc>

" leader+e to close window fast
noremap <leader>q :q<cr>

" leader+b to close buffer fast
noremap <leader>b :bd<cr>

" Save file fast in insert mode
imap <leader>w <esc>:w<CR>

" Go to next line in insert mode
inoremap <C-j> <C-o>o
inoremap <C-l> <C-o>A

" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
nmap <Leader>es :e ~/.vim/snippets/

" Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

" Make NERDTree easier to toggle
nmap <C-Z> :NERDTreeToggle<cr>

nmap <C-S> :CtrlPBufTag<cr>
nmap <C-C> :CtrlPMRUFiles<cr>

nmap <Leader>f :tag<space>
"-------------------------------Key Binding--------------------------------"






"-------------------------------Plugins Related----------------------------"

""""""""""""""""""""
" => NERDTre
""""""""""""""""""""
let NERDTreeHijackNetrw = 0
let NERDTreeShowHidden = 1


""""""""""""""""""""
" => Lightline
""""""""""""""""""""
set laststatus=2	"show light line status bar
set noshowmode		"hide --INSERT-- etc mode bar
let g:lightline = { 'colorscheme': 'palenight' }


""""""""""""""""""""
" => VimWiki
""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]


""""""""""""""""""""
" => easymotion
""""""""""""""""""""
nmap <leader>s <Plug>(easymotion-s2)


""""""""""""""""""""
" => fzf
""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
nnoremap <silent> <Leader>rg :Rg <C-R><C-W><CR>
nnoremap <silent> <c-p> :Files <CR>
"-------------------------------Plugins Related----------------------------"


"----------Auto-Commands-------------"
"Automatically source the Vimrc file on save
augroup autosourcing 
	auto!
	autocmd BufWritePost .vimrc source %
augroup END


"-----------another file in the future Laravel-Specific--------------"
"nmap <Leader>lr :e app/Http/routes.php<cr>
"nmap <Leader>lm :!php artisan make:
"nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
"nmap <Leader><Leader>m :CtrlP<cr>app/
"nmap <Leader><Leader>v :e resources/views/<cr>
