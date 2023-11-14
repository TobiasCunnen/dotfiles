vim.g.mapleader = " "

vim.keymap.set("n","<leader>ld", vim.cmd.Ex)

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

-- Yank into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>rf", vim.lsp.buf.format)

-- Better mergetool mappings
vim.keymap.set("n", "<leader>gh", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "<leader>gl", "<cmd>diffget //3<CR>")

-- Remap window switching
vim.keymap.set("n", "H", ":wincmd h<CR>")
vim.keymap.set("n", "K", ":wincmd k<CR>")
vim.keymap.set("n", "J", ":wincmd j<CR>")
vim.keymap.set("n", "L", ":wincmd l<CR>")

-- Undotree
vim.keymap.set('n', '<leader>u', function()
	vim.cmd.UndotreeToggle()
	vim.cmd.UndotreeFocus()
end)
