vim.g.mapleader = " "

-- Set :W to save because I do this a lot
vim.keymap.set('c', 'W', 'w')

-- Move highlighted code block
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor centerd when navigating
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without yank
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Better mergetool mappings
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")

-- Run perl tidy
vim.keymap.set("n", "<leader>pt", function()
    local position = vim.api.nvim_win_get_cursor(0)
    vim.cmd(":%! perltidy -fnl -b -bext='/'")
    vim.api.nvim_win_set_cursor(0, position)
end)

-- Remap window switching
-- vim.keymap.set("n", "H", ":wincmd h<CR>")
-- vim.keymap.set("n", "K", ":wincmd k<CR>")
-- vim.keymap.set("n", "J", ":wincmd j<CR>")
-- vim.keymap.set("n", "L", ":wincmd l<CR>")
