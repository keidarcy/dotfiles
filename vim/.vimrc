
set nocompatible                        "We want the latest Vim settings/options.

so ~/.vim/plugins.vim

syntax enable

"-------------------------------Basic Setting------------------------------------------"

let mapleader = ','                     "The default leader is \, but a comma is better. 
set backspace=indent,eol,start          "Make backspace behave like every other editor.
set nonumber                            "Let's activate line numbers.
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
let g:palenight_terminal_italics=1
colorscheme palenight                    "dacula, solarized, molokai, palenight
set t_CO=256                            "Use 256 colors. This is useful for Terminal Vim.

hi LineNr ctermfg=bg ctermbg=bg        " tweak color. fake a custom left padding 
set foldcolumn=0                       " hi means highlight
hi foldcolumn ctermbg=bg
hi vertsplit ctermfg=bg ctermbg=bg

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

"-------------------------------Basic Setting-----------------------------------"


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
" => CtrlP
""""""""""""""""""""
let g:ctrlp_custome_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:15'


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
