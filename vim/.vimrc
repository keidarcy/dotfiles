
set nocompatible                        "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable
set background=dark

let mapleader = ','                     "The default leader is \, but a comma is better. 
set backspace=indent,eol,start          "Make beacspace behave like every other editor.
set nonumber                            "Let's activate line numbers.
set noerrorbells visualbell t_vb=	"No bell!
set autowriteall                        "Automatically write the file when switching buffers.
set complete=.,w,b,u                    "Set our desired autocompletion matching.
"set belloff=all
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set clipboard=unnamed                   "Mac OS X clipboard sharing

"---------------Visuals-------------"
"colorscheme molokai
"colorscheme dacula
set t_CO=256                            "Use 256 colors. This is useful for Terminal Vim.

" tweak color. fake a custom left padding 
" hi means highlight
"hi LineNr ctermfg=bg ctermbg=bg
set foldcolumn=0
hi foldcolumn ctermbg=0
"hi vertsplit ctermfg=bg ctermbg=bg

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
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O


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
nmap <Leader>ep :e ~/.vim/plugins.vim<cr>
nmap <Leader>es :e ~/.vim/snippets/

"Add simple highlight removal
nmap <Leader><space> :nohlsearch<cr>

"Make NERDTree easier to toggle
nmap <C-Z> :NERDTreeToggle<cr>

nmap <C-S> :CtrlPBufTag<cr>
nmap <C-C> :CtrlPMRUFiles<cr>

"map Esc to jj 
imap jj <Esc>

nmap <Leader>f :tag<space>


"-------------Laravel-Specific--------------"
"nmap <Leader>lr :e app/Http/routes.php<cr>
"nmap <Leader>lm :!php artisan make:
"nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
"nmap <Leader><Leader>m :CtrlP<cr>app/
"nmap <Leader><Leader>v :e resources/views/<cr>




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
let NERDTreeShowHidden = 1

"/
"/ LightLine
"/
set laststatus=2	"show light line status bar
set noshowmode		"hide --INSERT-- etc mode bar


"----------Auto-Commands-------------"
"Automatically source the Vimrc file on save
augroup autosourcing 
	auto!
	autocmd BufWritePost .vimrc source %
augroup END


"--------------Tips------------------"
" 1.<C-6> toggle from two files
" 2.<C-o> go back; <C-i> go forward
" 3.'zz' go middle
" 4.change surrounding double quote to single quote cs"'
" 5.'J' will take the next line below to current line
" 6. '.' always repeat last operation
" 7.mark:
"       'm', any key to mark,
"       then backtick the key marked bring you back
" :marks to check
" 8.macros:
"       'q', any key to register,
"       @ + the key
" :reg to check
