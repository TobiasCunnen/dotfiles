-- Fast file switcher for a project
return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<A-a>", mark.add_file, { desc = "Set Harpoon Mark" })
        vim.keymap.set("n", "<A-u>", ui.toggle_quick_menu, { desc = "Show Harpoon Ui" })

        vim.keymap.set("n", "<A-h>", function() ui.nav_file(1) end)
        vim.keymap.set("n", "<A-j>", function() ui.nav_file(2) end)
        vim.keymap.set("n", "<A-k>", function() ui.nav_file(3) end)
        vim.keymap.set("n", "<A-l>", function() ui.nav_file(4) end)
        vim.keymap.set("n", "<A-;>", function() ui.nav_file(5) end)
        vim.keymap.set("n", "<A-'>", function() ui.nav_file(6) end)
    end,
}
