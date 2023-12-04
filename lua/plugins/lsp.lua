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
            "folke/neodev.nvim",
            "hrsh7th/cmp-nvim-lsp",
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
                }
            }

            -- Setup Neodev before LSP Config
            require("neodev").setup()

            -- LSP Status Information
            require('fidget').setup()

            -- Setup Keybindings for LSP
            local on_attach = function(client, bufnr)
                -- Hover Actions
                local keymap_opts = { buffer = buffer }
                vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, keymap_opts)
                vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, keymap_opts)
                vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, keymap_opts)
                vim.keymap.set('n', 'gh', vim.lsp.buf.hover, keymap_opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, keymap_opts)
                vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, keymap_opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, keymap_opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, keymap_opts)
                vim.keymap.set('n', 'g0', vim.lsp.buf.document_symbol, keymap_opts)
                vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, keymap_opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keymap_opts).set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
            end
        end
    }

    ---- LSP Servers
    --{
    --    'neovim/nvim-lspconfig',
    --    opts = {
    --        inlay_hints = {
    --            enabled = true
    --        },

    --        ---@type lspconfig.options
    --        servers = {
    --            tailwindcss = {
    --                root_dir = function(...)
    --                    return require('lspconfig.util').root_pattern('.git')(...)
    --                end
    --            },
    --            tsserver = {
    --                single_file_support = false,
    --                settings = {
    --                    typescript = {
    --                        inlayHints = {
    --                            includeInlayParameterNameHints = "literal",
    --                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --                            includeInlayFunctionParameterTypeHints = true,
    --                            includeInlayVariableTypeHints = false,
    --                            includeInlayPropertyDeclarationTypeHints = true,
    --                            includeInlayFunctionLikeReturnTypeHints = true,
    --                            includeInlayEnumMemberValueHints = true,
    --                        },
    --                    },
    --                    javascript = {
    --                        inlayHints = {
    --                            includeInlayParameterNameHints = "all",
    --                            includeInlayParameterNameHintsWhenArgumentMatchesName = false,
    --                            includeInlayFunctionParameterTypeHints = true,
    --                            includeInlayVariableTypeHints = true,
    --                            includeInlayPropertyDeclarationTypeHints = true,
    --                            includeInlayFunctionLikeReturnTypeHints = true,
    --                            includeInlayEnumMemberValueHints = true,
    --                        },
    --                    },
    --                },
    --            },
    --        },
    --    }
    --},

    --{'williamboman/mason-lspconfig.nvim'}, -- Bridge for Mason and LSP Configs

    ---- [[ Other LSP ]]
    --{'j-hui/fidget.nvim'},                 -- Visualize LSP Progress

}
