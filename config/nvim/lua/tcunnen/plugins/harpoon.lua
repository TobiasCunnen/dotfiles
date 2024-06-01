-- Fast file switcher for a project
return {
    "ThePrimeagen/harpoon",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "fa", mark.add_file, { desc = "Set Harpoon Mark" })
        vim.keymap.set("n", "fu", ui.toggle_quick_menu, { desc = "Show Harpoon Ui" })

        vim.keymap.set("n", "fh", function() ui.nav_file(1) end)
        vim.keymap.set("n", "fj", function() ui.nav_file(2) end)
        vim.keymap.set("n", "fk", function() ui.nav_file(3) end)
        vim.keymap.set("n", "fl", function() ui.nav_file(4) end)
        vim.keymap.set("n", "f;", function() ui.nav_file(5) end)
        vim.keymap.set("n", "f'", function() ui.nav_file(6) end)
    end,
}
