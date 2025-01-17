return {
    'mrcjkb/rustaceanvim',          -- Tools to make rust-analyzer LSP better
    event = "LspAttach",
    version = '^4',
    ft = { 'rust' },
    config = function()
        vim.g.rustaceanvim = {
            server = {
                settings = {
                    ['rust-analyzer'] = {
                        check = {
                            command = "clippy",
                        }
                    }
                }
            }
        }
    end
}
