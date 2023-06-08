opts = {
    prompt_func_return_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },

    prompt_func_param_type = {
        go = false,
        java = false,

        cpp = false,
        c = false,
        h = false,
        hpp = false,
        cxx = false,
    },
    printf_statements = {},
    print_var_statements = {},
}

require('refactoring').setup(opts)

-- Notice that these maps (except the last two) are visual mode remaps, and that
-- ESC is pressed before executing the command. As of now, these are both necessary for the plugin to work.

-- Remaps for the refactoring operations currently offered by the plugin
vim.api.nvim_set_keymap('v', '<leader>ref', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('v', '<leader>retf', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('v', '<leader>rev', [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('v', '<leader>riv', [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
vim.api.nvim_set_keymap('n', '<leader>reb', [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap('n', '<leader>rebf', [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
vim.api.nvim_set_keymap('n', '<leader>ri', [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Catchall refactor. Just highlight what you want, then press <Leader>rr
vim.api.nvim_set_keymap('v', '<leader>rr', [[ <Cmd>lua require('refactoring').select_refactor()<CR>]], {noremap = true, silent = true, expr = false})
