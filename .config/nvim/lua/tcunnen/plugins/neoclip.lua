return {
    'AckslD/nvim-neoclip.lua',
    event = "VeryLazy",
    opts = {},
    config = function()
        require('neoclip').setup({
            keys = {
                telescope = {
                    n = {
                        paste = { 'p', '<CR>' },
                    },
                },
            },
        });
        require('telescope').load_extension('neoclip')

        vim.keymap.set('n', '<leader>nc', ':Telescope neoclip initial_mode=normal<cr>', { desc = 'Telescope [N]eo[C]lip' })
    end
}
