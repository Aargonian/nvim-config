-- [ Config Options and Setup for nvim-tree ]
local map = vim.api.nvim_set_keymap
local g = vim.g

require('nvim-tree').setup{
    view = {
        preserve_window_proportions = true
    }
}

map('n', '<Leader>n', ':NvimTreeToggle<CR>', { silent = true })

-- Disable netrw for nvim-tree
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.nvim_tree_git_hl = 1
g.nvim_tree_add_trailing = 0
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
}
