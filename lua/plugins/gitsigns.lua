return {
    'lewis6991/gitsigns.nvim',           -- Added/Removed/Modified Git Lines and Such

    config = function()
        require('gitsigns').setup{}
        -- require('gitsigns').setup{
        --     signs = {
        --         add          = { text = '+' },
        --         change       = { text = '=' },
        --         delete       = { text = '-' },
        --         topdelete    = { text = '‾' },
        --         changedelete = { text = '~' },
        --         untracked    = { text = '┆' },
        --     },
        --     signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        --     numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
        --     linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
        --     word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
        --     watch_gitdir = {
        --         interval = 1000,
        --         follow_files = true
        --     },
        --     attach_to_untracked = true,
        --     current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        --     current_line_blame_opts = {
        --         virt_text = true,
        --         virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        --         delay = 1000,
        --         ignore_whitespace = false,
        --     },
        --     current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        --     sign_priority = 6,
        --     update_debounce = 100,
        --     status_formatter = nil, -- Use default
        --     max_file_length = 40000, -- Disable if file is longer than this (in lines)
        --     preview_config = {

        --     -- Options passed to nvim_open_win
        --     border = 'single',
        --         style = 'minimal',
        --         relative = 'cursor',
        --         row = 0,
        --         col = 1
        --     },
        -- }

        -- vim.cmd([[
        --     set signcolumn=yes
        --     autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
        -- ]])

        -- -- Setup Diagnostic Signs
        -- local sign = function(opts)
        --     vim.fn.sign_define(opts.name, {
        --         texthl = opts.name,
        --         text = opts.text,
        --         numhl = ''
        --     })
        -- end

        -- sign({name = 'DiagnosticSignError', text = ''})
        -- sign({name = 'DiagnosticSignWarn', text = ''})
        -- sign({name = 'DiagnosticSignHint', text = ''})
        -- sign({name = 'DiagnosticSignInfo', text = ''})

        -- vim.diagnostic.config({
        --     signs = true,
        --     update_in_insert = true,
        --     underline = true,
        --     severity_sort = false,
        --     float = {
        --         border = 'rounded',
        --         source = 'always',
        --         header = '',
        --         prefix = '',
        --     },
        -- })
    end
}
