-- LSP Configuration & Plugins
return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Useful status updates for LSP
        { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        'folke/neodev.nvim',
    },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config

        lsp_defaults.capabilities = vim.tbl_deep_extend(
            'force',
            lsp_defaults.capabilities,
            require('cmp_nvim_lsp').default_capabilities()
        )

        -- Rename function that only exists because the Perl LSP does not have rename capabilities
        function Rename()

            local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })

            for _, client in pairs(clients) do
                if client.supports_method("textDocument/rename") then
                    return vim.lsp.buf.rename()
                end
            end

            local node = vim.treesitter.get_node()
            if node == nil then return end
            local range = Get_range(node)

            local current_word = vim.fn.expand("<cword>")
            vim.ui.input({ prompt = "New name: ", default = current_word }, function(new_name)
                if new_name == nil then return end
                vim.cmd(':'.. range .. 's/' .. current_word .. '/' .. new_name .. '/g')
            end)

            vim.cmd('noh')
        end

        -- This only works for Perl now
        function Get_range(node)
            local parent = node:parent()
            local start_pos, col1, end_pos, col2 = node:range()
            start_pos = start_pos + 2
            if parent == nil or parent:type() == 'source_file' then
                return '%'
            end
            if parent:type() == 'subroutine_declaration_statement' or parent:type() == 'conditional_statement' then
                return start_pos .. ',' .. end_pos
            end
            return Get_range(parent)
        end

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
                vim.keymap.set('n', '<leader>rn', Rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set({ 'n', 'x' }, '<leader>fc', vim.lsp.buf.format, opts)
            end
        })

        vim.diagnostic.config({
            virtual_text = {
                prefix = ' ●',
            },
            float = { border = "rounded" },
        })

        -- Global rounded borders for docs
        local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = "rounded"
            return orig_util_open_floating_preview(contents, syntax, opts, ...)
        end

        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end
    end,
}
