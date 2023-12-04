return {
    'stevearc/oil.nvim',
    opts = {},
    keys = {
        { '<leader>ld', function() vim.cmd.Oil('--float') end, desc = '[L]ist [D]irecotry' },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            keymaps = {
                ["q"] = "actions.close",
                ["<ESC>"] = "actions.close",
            }
        })
    end,
}
