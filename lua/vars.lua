-- [[ vars.lua ]]

local g = vim.g
g.t_co = 256
g.background = 'dark'

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
vim.o.packpath = vim.o.packpath .. ',' .. packer_path

-- NVIM-TREE Options
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

-- Rustfmt on save
vim.cmd('au BufWrite * :Autoformat')
