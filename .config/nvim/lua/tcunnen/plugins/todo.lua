return {
    'folke/todo-comments.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    config = function()
        require('todo-comments').setup();
        vim.keymap.set('n', '<leader>td', '<cmd>TodoTelescope keywords=TODO,HACK,FIX,BUG,WARN,PERF,NOTE,TEST initial_mode=normal<CR>', { desc = "[F]ind all [F]iles" })
    end
}
