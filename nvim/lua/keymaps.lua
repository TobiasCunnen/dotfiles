vim.g.mapleader = " "

-- Remap undo to U
vim.keymap.set('n', 'U', '<c-r>')

-- Clear search highlight until next search
vim.keymap.set('n', '<ESC>', ':noh<CR>')

-- Move highlighted code block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centered when navigating
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- Paste without yank
vim.keymap.set("x", "<leader>p", [["_dP]])
