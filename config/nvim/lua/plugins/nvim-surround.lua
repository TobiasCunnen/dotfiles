return {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    config = function()
        require('nvim-surround').setup({
            keymaps = {
                snsert = '<C-g>a',
                insert_line = '<C-g>A',
                normal = '<leader>sa',
                normal_cur = '<leader>sA',
                normal_line = '<leader>saa',
                normal_cur_line = '<leader>sAa',
                visual = '<leader>sa',
                visual_line = '<leader>sA',
                delete = '<leader>sd',
                change = '<leader>sr',
            },
        })
    end
}
