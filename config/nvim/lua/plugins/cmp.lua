-- Autocompletion
return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        -- Adds LSP completion capabilities
        'hrsh7th/cmp-nvim-lsp',
        -- Adds path completion
        'hrsh7th/cmp-path',
        -- Adds a number of user-friendly snippets
        'rafamadriz/friendly-snippets',
        'onsails/lspkind.nvim',
        {
            "Exafunction/codeium.nvim",
            cmd = "Codeium",
            build = ":Codeium Auth",
            opts = {},
        },
    },
    config = function()
        local cmp = require('cmp')
        local luasnip = require('luasnip')
        local lspkind = require('lspkind')
        require('luasnip.loaders.from_vscode').lazy_load()
        luasnip.config.setup {}

        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            -- Add borders around the popup window
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = "symbol",
                    maxwidth = 50,
                    ellipsis_char = '...',
                    symbol_map = { Codeium = "", }
                }),
            },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-y>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = "codeium" },
            },
        }

        --TODO: Set custom snippets
        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end

        vim.keymap.set({ "i", "s" }, "<c-l>", function()
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            end
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-h>", function()
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            end
        end, { silent = true })
    end,
}
