return {
    'nvim-lualine/lualine.nvim',         -- Status Line
    config = function()
        require('lualine').setup {
            options = {
                theme = vim.g.nytegear_lualine_theme,
            },
        }
    end
}
