return {
    'debugloop/telescope-undo.nvim',
    dependencies = {
        {
            'nvim-telescope/telescope.nvim',
            dependencies = { 'nvim-lua/plenary.nvim' },
        },
    },
    keys = {
        { '<leader>u', '<cmd>Telescope undo initial_mode=normal<cr>', desc = 'undo history' },
    },
    opts = {
        extensions = {
            undo = {
                mappings = {
                    n = {
                        ['ya'] = function(bufnr)
                            return require('telescope-undo.actions').yank_additions(bufnr)
                        end,
                        ['yd'] = function(bufnr)
                            return require('telescope-undo.actions').yank_deletions(bufnr)
                        end,
                        ['u'] = function(bufnr)
                            return require('telescope-undo.actions').restore(bufnr)
                        end,
                    },
                },
            },
        },
    },
    config = function(_, opts)
        require('telescope').setup(opts)
        require('telescope').load_extension('undo')
    end,
}
