return {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
        local map = vim.api.nvim_set_keymap
        require('hop').setup{
            keys = 'etovxqpdygfblzhckisuran'
        }

        -- Keys
        map('n', '<Leader>h', ':HopWord<CR>', {silent = true})
    end
}
