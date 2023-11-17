return {
    'stevearc/oil.nvim',
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            keymaps = {
                ["q"] = "actions.close",
                ["<ESC>"] = "actions.close",
            }
        })

        vim.keymap.set("n", "<leader>ld", function() vim.cmd.Oil('--float') end, { desc = "[L]ist [D]irectory" })
    end,
}
