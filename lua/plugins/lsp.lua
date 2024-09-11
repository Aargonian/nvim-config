-- Setup Keybindings for LSP
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Setup Inlay Hints
        -- Currently Requires Neovim >0.10 (Nightly)
--        vim.lsp.inlay_hint.enable(ev.buf, true)
        -- Setup Signs
        local signs = { Error = "🛑", Warn = "⚠️", Hint = "💡", Info = "ℹ️"}
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end

        -- Setup Keybinds
        local keymap_opts = { buffer = ev.buf }
        vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, keymap_opts)
        vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, keymap_opts)
        vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, keymap_opts)
        vim.keymap.set('n', 'gs', vim.lsp.buf.hover, keymap_opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, keymap_opts)
        vim.keymap.set('n', 'gy', vim.lsp.buf.signature_help, keymap_opts)
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
            "folke/neodev.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "WhoIsSethDaniel/toggle-lsp-diagnostics.nvim",
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
            require("mason-lspconfig").setup{
                ensure_installed = {
                    "lua_ls",
                    "omnisharp",
                }
            }

            -- Setup Neodev before LSP Config
            require("neodev").setup()

            -- LSP Status Information
            require('fidget').setup()

            -- Setup LSP Diagnostics
            require('toggle_lsp_diagnostics').init()

            -- Setup Omnisharp
            require('lspconfig').omnisharp.setup {
                capabilities = capabilities
            }
        end
    }
}
