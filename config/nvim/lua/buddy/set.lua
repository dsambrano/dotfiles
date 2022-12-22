vim.g.mapleader = " "
vim.g.python3_host_prog = '~/.config/nvim/venv/bin/python3'
-- Line Numbers Relative and Add line number for middle
vim.opt.nu = true
vim.opt.relativenumber = true

-- Indents 4 spaces no tabs and be smart
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Let Undotree handle backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Highlights in Search the Smart way
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

