return {
    'rachartier/tiny-inline-diagnostic.nvim',
    config = function()
        require('tiny-inline-diagnostic').setup {
            options = {
                throttle = 0,
                multiple_diag_under_cursor = true,
                show_all_diags_on_cursorline = true,
                enable_on_insert = true,
                multilines = {
                    enabled = true,
                    always_show = true,
                }
            },
        }
        vim.diagnostic.config({ virtual_text = false })
    end
}
