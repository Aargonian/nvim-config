-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Remap pane splitting
map('n', '_', ':split<CR>', {silent = true})
map('n', '|', ':vsplit<CR>', {silent = true})

-- Remap pane navigation
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})
map('n', '<C-Left>', ':vertical resize +3<CR>', {silent = true})
map('n', '<C-Right>', ':vertical resize -3<CR>', {silent = true})
map('n', '<C-Up>', ':resize -3<CR>', {silent = true})
map('n', '<C-Down>', ':resize +3<CR>', {silent = true})
