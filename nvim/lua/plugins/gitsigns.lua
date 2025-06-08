-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
    'lewis6991/gitsigns.nvim',
    event = "VeryLazy",
    opts = {
        signs = {
            add = { text = '+' },
            change = { text = '~' },
            delete = { text = '-' },
            topdelete = { text = '‾' },
            changedelete = { text = '_' },
        },
        on_attach = function(bufnr)
            vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk,
                { buffer = bufnr, desc = '[P]review git [H]unk' })
            vim.keymap.set('n', '<leader>rh', require('gitsigns').reset_hunk,
                { buffer = bufnr, desc = '[R]eset git [H]unk' })

            -- don't override the built-in and fugitive keymaps
            local gs = package.loaded.gitsigns
            vim.keymap.set({ 'n', 'v' }, ']c', function()
                if vim.wo.diff then
                    return ']c'
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
            vim.keymap.set({ 'n', 'v' }, '[c', function()
                if vim.wo.diff then
                    return '[c'
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return '<Ignore>'
            end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
        end,
        preview_config = {
            border = 'rounded',
        },
    },
}
