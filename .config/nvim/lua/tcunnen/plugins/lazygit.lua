return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim"
    },
    config = function()
        require("telescope").load_extension("lazygit")
        vim.keymap.set('n', '<leader>g', function () require('lazygit').lazygit() end, { desc = "Open [L]azy [G]it window" })
    end,
};
