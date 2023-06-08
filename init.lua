-- [[ init.lua]]
-- [[ SPEED - Significantly speeds up plugin loading ]]
vim.loader.enable()

-- Fix the clipboard to allow using the system clipboard
vim.api.nvim_set_option('clipboard', 'unnamed')

-- LEADER
vim.g.mapleader = ','
vim.g.localleader = '\\'

-- IMPORTS
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps
require('plug') -- Plugins

-- Colorscheme
vim.cmd('colorscheme gruvbox-material')

-- Plugin configs, keymappings, etc.
require('[00] completion')
require('[01] format')
require('[01] hop')
require('[02] telescope')
require('[03] floatterm')
require('[04] nvim-tree')
require('[05] nvim-treesitter')
require('[06] lualine')
require('[07] barbar')
require('[08] gitsigns')
require('[09] mason')
require('[10] completion')
require('[11] vimspector')
require('[12] tagbar')
require('[13] trouble')
require('[14] alpha')
require('[15] refactoring')

-- Diagnostic stuff?
local sign = function(opts)
    vim.fn.sign_define(opts.name, {
        texthl = opts.name,
        text = opts.text,
        numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = ''})
sign({name = 'DiagnosticSignWarn', text = ''})
sign({name = 'DiagnosticSignHint', text = ''})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    signs = true,
    update_in_insert = true,
    underline = true,
    severity_sort = false,
    float = {
        border = 'rounded',
        source = 'always',
        header = '',
        prefix = '',
    },
})
