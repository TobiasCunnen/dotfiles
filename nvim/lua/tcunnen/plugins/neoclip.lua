return {
    'AckslD/nvim-neoclip.lua',
    opts = {},
    config = function()
        require('neoclip').setup();
        require('telescope').load_extension('neoclip')

        vim.keymap.set('n', '<leader>nc', ':Telescope neoclip initial_mode=normal<cr>', { desc = 'Telescope [N]eo[C]lip' })
    end
}
