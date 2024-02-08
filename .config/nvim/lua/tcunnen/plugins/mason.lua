-- Automatically install LSP's for neovim
return {
    'williamboman/mason.nvim',
    dependencies = {
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require('mason').setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require('mason-lspconfig').setup()

        -- Enable the following language servers
        -- If you want to override the default filetypes that your language server will attach to you can
        -- define the property 'filetypes' to the map in question.
        local servers = {
            bashls = {
                filetypes = {
                    'sh', 'bats'
                }
            },
            lua_ls = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            perlnavigator = {
                perlnavigator = {
                    perlPath = 'perl',
                    enableWarnings = true,
                    perlcriticEnabled = false,
                    includePaths = { vim.loop.cwd() .. '/cli/src/lib' },
                }
            },
            gopls = {
                gopls = {
                    usePlaceholders = true,
                    analyses = {
                        unusedparams = true,
                    },
                }
            },
        }

        -- Setup neovim lua configuration
        require('neodev').setup()

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        -- Ensure the servers above are installed
        local mason_lspconfig = require 'mason-lspconfig'

        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        mason_lspconfig.setup_handlers {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    settings = servers[server_name],
                    on_attach = on_attach,
                    filetypes = (servers[server_name] or {}).filetypes,
                }
            end,
        }
    end
}
