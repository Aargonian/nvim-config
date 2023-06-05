local map = vim.api.nvim_set_keymap

-- map('n', '<Leader>nt', ':FloatermNew --name=guake --height=0.5 --width=0.5 --autoclose=2 zsh <CR>', {silent = true})
map('n', '<Leader>t', ':FloatermToggle guake<CR>', {silent = true})

-- Remap terminal mode to quickly close the terminal and allow entering normal mode in the terminal
map('t', '<Leader>t', '<C-\\><C-n>:q<CR>', {silent = true})
map('t', '<Esc>', '<C-\\><C-n>', {silent = true})
