-- Code to run whenever a language server attaches to a buffer
local on_attach = function(lsp_client, buffer_number)
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
    local keymap_opts = { buffer = buffer_number }
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
end

local servers = {
    pylsp = {},
    omnisharp = {},
    html = {},
    lua_ls = {
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
            },
        },
    },
    rust_analyzer = {
        settings = {
            ['rust-analyzer'] = {
                check = {
                    command = "clippy",
                }
            }
        }
    },
    tailwindcss = {},
    -- nil_ls = {},
    bashls = {
        filetypes = { 'bash', 'sh', 'zsh' }
    },
    ts_ls = {
        init_options = {
            preferences = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
                importModuleSpecifierPreference = 'non-relative',
            },
        },
    },
}

return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        "hrsh7th/cmp-nvim-lsp",
    },
    opts = {
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

        -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        capabilities.textDocument.completion.completionItem.snippetSupport = true

        require("mason-lspconfig").setup {
            ensure_installed = vim.tbl_keys(servers),
        }

        for name, conf in pairs(servers) do
            local cfg = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
                on_attach = on_attach,
            }, conf)

            vim.lsp.config(name, cfg)
        end

        -- LSP Status Information
        require('fidget').setup()
    end
}
