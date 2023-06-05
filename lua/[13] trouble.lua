local map = vim.api.nvim_set_keymap

map('n', '<Leader>x', ':TroubleToggle workspace_diagnostics<CR>', {silent = true})
