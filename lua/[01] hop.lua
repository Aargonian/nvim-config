local map = vim.api.nvim_set_keymap
-- Hop
require('hop').setup()

-- Keys
map('n', '<Leader>h', ':HopWord<CR>', {silent = true})
