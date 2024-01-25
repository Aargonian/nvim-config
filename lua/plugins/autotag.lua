return {
    'windwp/nvim-ts-autotag', -- Autotagging for HTML/CSS/JSX/etc.
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        require('nvim-ts-autotag').setup()
    end
}
