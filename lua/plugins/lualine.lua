return {
    'nvim-lualine/lualine.nvim',         -- Status Line
    config = function()
        require('lualine').setup {
            options = {
                theme = 'everforest'
            },
        }
    end
}
