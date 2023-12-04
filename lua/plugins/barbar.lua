return {
    'romgrk/barbar.nvim',                -- Tabs for Buffers and easy buffer use
    config = function()
        vim.g.barbar_auto_setup = false
        require('barbar').setup({
            sidebar_filetypes = {
                NvimTree = true
            }
        })

        local map = vim.api.nvim_set_keymap
        local opts = { noremap = true, silent = true }

        -- Move to previous/next
        -- map('n', '<C-H>', '<Cmd>BufferPrevious<CR>', opts)
        -- map('n', '<C-L>', '<Cmd>BufferNext<CR>', opts)
        -- -- Re-order to previous/next
        -- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
        -- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
        -- Goto buffer in position...
        map('n', '<C-1>', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<C-2>', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<C-3>', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<C-4>', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<C-5>', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<C-6>', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<C-7>', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<C-8>', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<C-9>', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<C-0>', '<Cmd>BufferLast<CR>', opts)
        -- Pin/unpin buffer
        -- map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
        -- Wipeout buffer
        --                 :BufferWipeout
        -- Close commands
        map('n', '<Leader-c>', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

        -- :BufferCloseAllButPinned
        -- :BufferCloseAllButCurrentOrPinned
        -- :BufferCloseBuffersLeft
        -- :BufferCloseBuffersRight
        
        -- Magic buffer-picking mode
        map('n', '<C-b>', '<Cmd>BufferPick<CR>', opts)

        -- Close windows
        map('n', '<C-c>', ':confirm BufferClose<CR>', {silent = true})
        -- Sort automatically by...
        -- map('n', '<C-Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        -- map('n', '<C-Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        -- map('n', '<C-Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        -- map('n', '<C-Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

        -- Other:
        -- :BarbarEnable - enables barbar (enabled by default)
        -- :BarbarDisable - very bad command, should never be used
    end
}
