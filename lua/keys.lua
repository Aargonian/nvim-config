-- [[ keys.lua ]]
local map = vim.api.nvim_set_keymap

-- Remap pane splitting
map('n', '_', ':split<CR>', {silent = true})
map('n', '|', ':vsplit<CR>', {silent = true})

-- Enable Ctrl+<VIM DIRECTION> to switch panes. I map Capslock to Ctrl so this is convenient.
map('n', '<C-h>', '<C-w>h', {silent = true})
map('n', '<C-j>', '<C-w>j', {silent = true})
map('n', '<C-k>', '<C-w>k', {silent = true})
map('n', '<C-l>', '<C-w>l', {silent = true})

-- Use Ctrl+Arrow to resize a pane. Convenient for me, since I never use arrows for movement.
map('n', '<C-Left>', ':vertical resize +3<CR>', {silent = true})
map('n', '<C-Right>', ':vertical resize -3<CR>', {silent = true})
map('n', '<C-Up>', ':resize -3<CR>', {silent = true})
map('n', '<C-Down>', ':resize +3<CR>', {silent = true})

-- Disable q: for command history - I rarely use it purposefully and mostly by accident when quitting
map('n', 'q:', '<Nop>', { noremap = true, silent = true })

-- Remap folding to be more sane
--
-- Map 'f' to toggle the fold under cursor
vim.keymap.set('n', 'f', 'za', { noremap = true })

-- Map 'Shift+f' (capital F) to toggle all folds open/closed
vim.keymap.set('n', 'F', function()
    if vim.w.folds_open then
        vim.opt_local.foldlevel = 0
        vim.w.folds_open = false
    else
        vim.opt_local.foldlevel = 99
        vim.w.folds_open = true
    end
end, { noremap = true })
