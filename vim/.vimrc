"For Mac terminal vim
set nocompatible                        "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable

let mapleader = ','                     "The default leader is \, but a comma is better. 
set backspace=indent,eol,start          "Make beacspace behave like every other editor.
set nonumber                              "Let's activate line numbers.
set noerrorbells visualbell t_vb=	"No bell!
"set belloff=all
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set clipboard=unnamed               "Mac OS X clipboard sharing

"---------------Visuals-------------"
"colorscheme dracula 
set t_CO=256                            "Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h17		"Set the default font family and size.
set guioptions-=e
set linespace=15                        "Not work in terminal vim.

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R




"---------------Search-------------"
set hlsearch
set incsearch

"-------closing brackets-------------"
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"---------------Split Management---------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>



"---------------Resize Management---------"
nmap <C-J><C-J> <C-W>- 
nmap <C-K><C-K> <C-W>+
nmap <C-H><C-H> <C-W><
nmap <C-L><C-L> <C-W>>

"---------------Mappings-------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <C-Z> :NERDTreeToggle<cr>

nmap <C-S> :CtrlPBufTag<cr>
nmap <C-E> :CtrlPMRUFiles<cr>

"map Esc to jj 
imap jj <Esc>

nmap <Leader>f :tag<space>




"-----------Plugins-------------"
"/
"/ CtrlP
"/
let g:ctrlp_custome_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'


"/
"/ NERDTree 
"/
let NERDTreeHijackNetrw = 0

"/
"/ LightLine
"/
set laststatus=2	"show light line status bar
set noshowmode		"hide --INSERT-- etc mode bar

"let g:tmuxline_preset = {
  "\'a'    : '#S',
  "\'c'    : ['#(whoami)', '#(uptime | cud -d " " -f 1,2,3)'],
  "\'win'  : ['#I', '#W'],
  "\'cwin' : ['#I', '#W', '#F'],
  "\'x'    : '#(date)',
  "\'y'    : ['%R', '%a', '%Y'],
  "\'z'    : '#H'}
"let g:tmuxline_theme = 'papercolor'
"}

"----------Auto-Commands-------------"
"Automatically source the Vimrc file on save
augroup autosourcing 
	auto!
	autocmd BufWritePost .vimrc source %
augroup END
