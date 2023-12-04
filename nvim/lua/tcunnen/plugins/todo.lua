return {
    'folke/todo-comments.nvim',
    keys = {
        { '<leader>st', '<cmd>TodoTelescope keywords=TODO,HACK,FIX initial_mode=normal<CR>', desc = '[S]how all [T]odo items' },
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
        require('todo-comments').setup();
    end
}
