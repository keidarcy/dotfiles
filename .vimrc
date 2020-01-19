set nocompatible                        "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable

"color molokai
"let g:molokai_original = 1
"let g:rehash256 = 1                     

let mapleader = ','                     "The default leader is \, but a comma is better. 
set backspace=indent,eol,start          "Make beacspace behave like every other editor.
set number                              "Let's activate line numbers.
set belloff=all




"---------------Visuals-------------"
colorscheme molokai
set t_CO=256                            "Use 256 colors. This is useful for Terminal Vim.
set guifont=Fira_Code:h17		"Set the default font family and size.
"set macligatures  			"We want pretty symbols, when available.
set linespace=15                        "Not work in terminal vim.
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R




"---------------Search-------------"
set hlsearch
set incsearch





"---------------Split Management---------"
set splitbelow
set splitright

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>




"---------------Mappings-------------"
"Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <C-1> :NERDTreeToggle<cr>

nmap <c-R> :CtrlPBufTag<cr>
nmap <D-e> :CtrlPMRUFiles<cr>

"map Esc to jj 
imap jj <Esc>

nmap <Leader>f :tag<space>




"-----------Plugins-------------"
"/
"/ CtrlP
"/
let g:ctrlp_custome_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"/
"/ NERDTree 
"/
let NERDTreeHijackNetrw = 0



"----------Auto-Commands-------------"
"Automatically source the Vimrc file on save
augroup autosourcing 
	auto!
	autocmd BufWritePost .vimrc source %
augroup END
