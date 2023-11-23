-- Interactive file searcher and more, telescope does almost everything
return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        'nvim-tree/nvim-web-devicons',
        'AckslD/nvim-neoclip.lua',
        'debugloop/telescope-undo.nvim',
    },
    config = function()
        require('neoclip').setup()

            -- config = function()
            -- end,
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = " ㅤ",
                selection_caret = " ",
            },
            extensions = {
            }
        })

        telescope.load_extension('fzf')
        telescope.load_extension('neoclip')
        vim.keymap.set("n", "<leader>o",  "<cmd>Telescope neoclip<CR>", { desc = "Telescope Neoclip" })

        telescope.load_extension('undo')
        vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind all [F]iles" })
        vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "[F]ind [G]it files" })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind all files in the [B]uffer" })
        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = "[S]earch [H]elp tags" })
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "[S]earch with [G]rep" })
        vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = "[S]earch [D]iagnostic" })
        vim.keymap.set('n', '<leader>km', builtin.keymaps, { desc = "[K]ey[M]aps" })
    end,
}
