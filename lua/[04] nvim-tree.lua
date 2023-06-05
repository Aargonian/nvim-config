-- [ Config Options and Setup for nvim-tree ]
local map = vim.api.nvim_set_keymap

-- Disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup{
    view = {
        preserve_window_proportions = true
    }
}

map('n', '<Leader>n', ':NvimTreeToggle<CR>', { silent = true })
