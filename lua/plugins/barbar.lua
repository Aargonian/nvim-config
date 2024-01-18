return {
    'romgrk/barbar.nvim',                -- Tabs for Buffers and easy buffer use
    config = function()
        vim.g.barbar_auto_setup = false
        require('barbar').setup({
            animation = true,
            clickable = true,
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
        map('n', '<Leader>1', '<Cmd>BufferGoto 1<CR>', opts)
        map('n', '<Leader>2', '<Cmd>BufferGoto 2<CR>', opts)
        map('n', '<Leader>3', '<Cmd>BufferGoto 3<CR>', opts)
        map('n', '<Leader>4', '<Cmd>BufferGoto 4<CR>', opts)
        map('n', '<Leader>5', '<Cmd>BufferGoto 5<CR>', opts)
        map('n', '<Leader>6', '<Cmd>BufferGoto 6<CR>', opts)
        map('n', '<Leader>7', '<Cmd>BufferGoto 7<CR>', opts)
        map('n', '<Leader>8', '<Cmd>BufferGoto 8<CR>', opts)
        map('n', '<Leader>9', '<Cmd>BufferGoto 9<CR>', opts)
        map('n', '<Leader>0', '<Cmd>BufferLast<CR>', opts)
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

        -- Custom Highlighting Code
        -- Wrapped in an autocmd to make sure it executes after the current colorscheme
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                vim.cmd [[
                  " Darcula theme base colors
                  " Current Buffer
                  hi BufferCurrent         guifg='#A9B7C6' guibg='#000000' gui=NONE
                  hi BufferCurrentMod      guifg='#CF748E' guibg='#550000' gui=NONE
                  hi BufferCurrentSign     guifg='#A9B7C6' guibg='#000000' gui=NONE
                  hi BufferCurrentNumber   guifg='#FFFF00' guibg='#000000' gui=bold
                  hi BufferCurrentIcon     guifg='#000000' guibg='#000000' gui=NONE
                  hi BufferCurrentIndex    guifg='#FFFF00' guibg='#000000' gui=NONE
                  hi BufferCurrentTarget   guifg='#9876AA' guibg='#000000' gui=NONE

                  " Visible Buffer
                  hi BufferVisible         guifg='#6A8759' guibg='#000000' gui=NONE
                  hi BufferVisibleMod      guifg='#C97F69' guibg='#550000' gui=NONE
                  hi BufferVisibleSign     guifg='#6A8759' guibg='#000000' gui=NONE
                  hi BufferVisibleNumber   guifg='#FF00FF' guibg='#000000' gui=bold
                  hi BufferVisibleIcon     guifg='#6897BB' guibg='#000000' gui=NONE
                  hi BufferVisibleIndex    guifg='#FF00FF' guibg='#000000' gui=NONE
                  hi BufferVisibleTarget   guifg='#9876AA' guibg='#000000' gui=NONE

                  " Inactive Buffer
                  hi BufferInactive        guifg='#808080' guibg='#000000' gui=NONE
                  hi BufferInactiveMod     guifg='#BF6477' guibg='#330000' gui=NONE
                  hi BufferInactiveSign    guifg='#808080' guibg='#000000' gui=NONE
                  hi BufferInactiveNumber  guifg='#FFFFFF' guibg='#000000' gui=bold
                  hi BufferInactiveIcon    guifg='#6897BB' guibg='#000000' gui=NONE
                  hi BufferInactiveIndex   guifg='#FFFFFF' guibg='#000000' gui=NONE
                  hi BufferInactiveTarget  guifg='#9876AA' guibg='#000000' gui=NONE
                ]]
            end
        })
    end
}
