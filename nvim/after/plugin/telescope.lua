local builtin = require('telescope.builtin')
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "[F]ind all [F]iles"})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {desc = "[F]ind [G]it files"})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "[F]ind all files in the [B]uffer"})
vim.keymap.set('n', '<leader>sh', builtin.help_tags, {desc = "[S]earch [H]elp tags"})
vim.keymap.set('n', '<leader>sg', builtin.live_grep, {desc = "[S]earch with [G]rep"})
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, {desc = "[S]earch [D]iagnostic"})
vim.keymap.set('n', '<leader>km', builtin.keymaps, {desc = "[K]ey[M]aps"})
