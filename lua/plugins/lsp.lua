-- Setup Keybindings for LSP on attach. Must be defined on attach.
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Setup Inlay Hints
        -- Currently Requires Neovim >0.10 (Nightly)
        --vim.lsp.inlay_hint.enable(ev.buf, true)
        vim.lsp.inlay_hint.enable(true)

        -- Setup Signs
        vim.diagnostic.config({
            signs = {
                text = {
                    [vim.diagnostic.severity.ERROR] = "🛑",
                    [vim.diagnostic.severity.WARN]  = "⚠️",
                    [vim.diagnostic.severity.HINT]  = "💡",
                    [vim.diagnostic.severity.INFO]  = "ℹ️"
                }
            }
        })

        -- Setup Keybinds
        local keymap_opts = { buffer = ev.buf }
        vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, keymap_opts)
        vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, keymap_opts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, keymap_opts)
        vim.keymap.set('n', 'gh', vim.lsp.buf.hover, keymap_opts)
        vim.keymap.set('i', '<C-Space>', vim.lsp.buf.hover, keymap_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, keymap_opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, keymap_opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, keymap_opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, keymap_opts)
        vim.keymap.set('n', 'g0', vim.lsp.buf.document_symbol, keymap_opts)
        vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, keymap_opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keymap_opts)
        --vim.keymap.set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
        vim.keymap.set('n', 'gf', function()
            vim.lsp.buf.format { async = true }
        end, keymap_opts)
    end,
})


return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
                event = "LspAttach",
            },
            "hrsh7th/cmp-nvim-lsp",
        },
        opts = {
            uesrLanguages = {
                rust = "html",
            },
            inlay_hints = {
                enabled = true
            },
        },

        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "",
                        package_pending = "",
                        package_uninstalled = "",
                    },
                }
            })

            require("mason-lspconfig").setup{
                ensure_installed = {
                    "lua_ls",
                    "pylsp",
                    "omnisharp",
                }
            }

            -- LSP Status Information
            require('fidget').setup()

            -- Setup Necessary Parameters for LSP
            require('lspconfig').ts_ls.setup({
                init_options = {
                    preferences = {
                        includeInlayParameterNameHints = 'all',
                        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                        importModuleSpecifierPreference = 'non-relative',
                    },
                },
            })

            -- Setup TailwindCSS server
            require('lspconfig').tailwindcss.setup({})

            -- Setup NIX
            require('lspconfig').nil_ls.setup({})

            -- Setup Lua
            require('lspconfig').lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' },
                            disable = { 'missing-fields' },
                        },
                        runtime = {
                            version = "LuaJIT",
                        },
                        workspace = {
                            library = vim.api.nvim_get_runtime_file("", true),
                        },
                    }
                }
            })

            -- Setup HTML
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities.textDocument.completion.completionItem.snippetSupport = true
            require('lspconfig').html.setup({ capabilities = capabilities, })

            -- Setup Omnisharp
            require('lspconfig').omnisharp.setup {
                capabilities = capabilities
            }
        end
    }
}
