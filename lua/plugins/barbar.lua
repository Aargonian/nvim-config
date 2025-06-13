return {
    'romgrk/barbar.nvim',                -- Tabs for Buffers and easy buffer use
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    event = "VeryLazy",
    opts = {
        animation = true,
        clickable = true,
        insert_at_end = true,
        highlight_visible = true,
        icons = {
            buffer_index = true,
            buffer_number = false,
            button = 'x',
            -- Enables / disables diagnostic symbols
            diagnostics = {
              [vim.diagnostic.severity.ERROR] = {enabled = true, icon = '🆘'},
              [vim.diagnostic.severity.WARN] = {enabled = true, icon = '⚠️'},
              [vim.diagnostic.severity.INFO] = {enabled = true, icon = 'ℹ️'},
              [vim.diagnostic.severity.HINT] = {enabled = true},
            },
            gitsigns = {
              added = {enabled = false, icon = '+'},
              changed = {enabled = false, icon = '~'},
              deleted = {enabled = false, icon = '-'},
            },
            filetype = {
              -- Sets the icon's highlight group.
              -- If false, will use nvim-web-devicons colors
              custom_colors = false,

              -- Requires `nvim-web-devicons` if `true`
              enabled = true,
            },
        },
        -- sidebar_filetypes = {
        --     NvimTree = true
        -- }
    },
    keys = {
        { '<Leader>1', '<Cmd>BufferGoto 1<CR>', },
        { '<Leader>2', '<Cmd>BufferGoto 2<CR>', },
        { '<Leader>3', '<Cmd>BufferGoto 3<CR>', },
        { '<Leader>4', '<Cmd>BufferGoto 4<CR>', },
        { '<Leader>5', '<Cmd>BufferGoto 5<CR>', },
        { '<Leader>6', '<Cmd>BufferGoto 6<CR>', },
        { '<Leader>7', '<Cmd>BufferGoto 7<CR>', },
        { '<Leader>8', '<Cmd>BufferGoto 8<CR>', },
        { '<Leader>9', '<Cmd>BufferGoto 9<CR>', },
        { '<Leader>0', '<Cmd>BufferLast<CR>'  , },

        -- Close Commands
        { '<Leader>bf', '<Cmd>BufferCloseAllButCurrent<CR>', },

        -- Magic buffer-picking mode
        { '<Leader>bs', '<Cmd>BufferPick<CR>', },

        -- Close current buffer
        { '<Leader>bc', ':confirm BufferClose<CR>', },

        -- Unused Currently
        -- Move to previous/next
        -- map('n', '<C-H>', '<Cmd>BufferPrevious<CR>', opts)
        -- map('n', '<C-L>', '<Cmd>BufferNext<CR>', opts)
        -- -- Re-order to previous/next
        -- map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
        -- map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
        -- Goto buffer in position...
        -- Pin/unpin buffer
        -- map('n', '<C-p>', '<Cmd>BufferPin<CR>', opts)
        -- Wipeout buffer
        --                 :BufferWipeout
        -- Close commands

        -- :BufferCloseAllButPinned
        -- :BufferCloseAllButCurrentOrPinned
        -- :BufferCloseBuffersLeft
        -- :BufferCloseBuffersRight
        --
        -- Sort automatically by...
        -- map('n', '<C-Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
        -- map('n', '<C-Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
        -- map('n', '<C-Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
        -- map('n', '<C-Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

        -- Other:
        -- :BarbarEnable - enables barbar (enabled by default)
        -- :BarbarDisable - very bad command, should never be used
    },
}
