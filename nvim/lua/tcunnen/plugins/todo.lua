return {
    --TODO it does not find any todo's
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    config = function ()

        require("todo-comments").setup();
        vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope keywords=TODO<CR>", { desc = "[S]how all [T]odo items" })
    end
}
