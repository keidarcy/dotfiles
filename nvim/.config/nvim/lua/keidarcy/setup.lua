-- vim.opt.guicursor = " " no fat cursor

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "0"

-- share clipboard with system
vim.opt.clipboard = "unnamedplus"

-- highlight on yank 200ms
vim.cmd [[au TextYankPost * lua vim.highlight.on_yank {on_visual = true}]]

-- run source on save
vim.cmd [[ augroup autosourcing
	auto!
	autocmd BufWritePost .vimrc source %
augroup END ]]

-- disable mouse
vim.opt.mouse = ""

-- add new line at end of file
vim.opt.eol = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- set 2 space for js,ts,tsx files
vim.cmd [[autocmd BufEnter *.{js,ts,tsx} :setlocal tabstop=2 shiftwidth=2 expandtab]]

-- vim.o.termguicolors = true
