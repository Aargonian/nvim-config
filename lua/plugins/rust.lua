return {
    'simrat39/rust-tools.nvim',          -- Tools to make rust-analyzer LSP better

    config = function()
        require('rust-tools').setup{
            tools = {
                runnables = {
                    use_telescope = true,
                },
                inlay_hints = {
                    auto = true,
                    show_parameter_hints = false,
                    parameter_hints_prefix = '',
                    other_hints_prefix = '',
                },
            },

            -- All the opts to send to nvim-lspconfig, overriding the defaults in rust-tools.nvim
            server = {
                on_attach = on_attach,
                settings = {
                    ['rust-analyzer'] = {
                        checkOnSave = {
                            command = 'clippy',
                        },
                    },
                },
            },
        }

        -- Autoformat on save using rust-analyzer
        local format_sync_grp = vim.api.nvim_create_augroup('Format', {})
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*.rs',
            callback = function()
                vim.lsp.buf.format({ timeout_ms = 200 })
            end,
            group = format_sync_grp
        })
    end
}
