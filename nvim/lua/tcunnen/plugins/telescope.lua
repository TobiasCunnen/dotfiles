-- Interactive file searcher and more, telescope does almost everything
return {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
    },
    config = function()
        local builtin = require('telescope.builtin')
        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')

        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind all [F]iles" })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "[F]ind [G]it files" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind all files in the [B]uffer" })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp tags" })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch with [G]rep" })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = "[S]earch [D]iagnostic" })
        vim.keymap.set('n', '<leader>km', builtin.keymaps, { desc = "[K]ey[M]aps" })
    end,
}
