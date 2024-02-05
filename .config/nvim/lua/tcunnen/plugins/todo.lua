return {
    'folke/todo-comments.nvim',
    keys = {
        { '<leader>td', '<cmd>TodoTelescope keywords=TODO,HACK,FIX initial_mode=normal<CR>', desc = 'Show all [T]o[d]o items' },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
        require('todo-comments').setup();
    end
}
