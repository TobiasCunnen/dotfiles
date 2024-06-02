vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Disable search highlight, unless active search
-- vim.opt.hlsearch = false
-- vim.cmd([[
--         augroup vimrc-incsearch-highlight
--         autocmd!
--         autocmd CmdlineEnter /,\? :set hlsearch
--         autocmd CmdlineLeave /,\? :set nohlsearch
--         augroup END
--         ]])
vim.opt.incsearch = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

-- Enable break indent
vim.o.breakindent = true

-- Decrease update time
vim.o.updatetime = 300
vim.o.timeoutlen = 350

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Removes the default mode prompt
vim.o.showmode = false

-- Shows trailing white spaces and more
vim.opt.list = true

-- Keep sign column on by default
vim.wo.signcolumn = 'yes'

-- Set global clipboard
vim.opt.clipboard = "unnamedplus"

-- Enable spell check
vim.opt.spell = true
