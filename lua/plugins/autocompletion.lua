return {
    -- [[ LSP Completion Source ]]
    'hrsh7th/nvim-cmp',                     -- NVIM Completion Framework
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-nvim-lua',                 -- Lua Autocompletion
        'hrsh7th/cmp-nvim-lsp-signature-help',
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-path',                     -- Completion for file system paths
        'hrsh7th/cmp-buffer',                   -- Completion from current buffer
        'hrsh7th/vim-vsnip',
        'L3MON4D3/LuaSnip',                     -- Snippet Engine
        'saadparwaiz1/cmp_luasnip',             -- for autocompletion
        'rafamadriz/friendly-snippets',         -- useful snippets
    },
    config = function()
        local opt = vim.opt

        opt.completeopt = {'menuone', 'noselect', 'noinsert'}
        opt.shortmess = opt.shortmess + { c = true }
        vim.opt.updatetime = 50

        -- local diag_float_grp = vim.api.nvim_create_augroup('DiagnosticFloat', {clear = true})
        -- vim.api.nvim_create_autocmd('CursorHold', {
        --     callback = function()
        --         vim.diagnostic.open_float(nil, { focusable = false })
        --     end,
        --     group = diag_float_grp,
        -- })

        -- Completion Plugin Setup
        local cmp = require('cmp')
        local luasnip = require'luasnip'

        luasnip.filetype_extend("all", { "_" })
        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            preselect = cmp.PreselectMode.None,

            -- Enable LSP snippets
            snippet = {
                -- expand = function(args)
                --     luasnip.lsp_expand(args.body)
                -- end,
                -- expand = function(args)
                --     vim.fn["vsnip#anonymous"](args.body)
                -- end,
            },

            mapping = {
                ['<C-k>'] = cmp.mapping.select_prev_item(),     -- Previous Suggestion
                ['<C-j>'] = cmp.mapping.select_next_item(),     -- Next Suggestion
                ['<C-Space>'] = cmp.mapping.complete(),         -- Show Completion Suggestions
                ['<C-e>'] = cmp.mapping.abort(),                -- Close the window
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false,
                }),
            },

            -- Installed sources:
            sources = {
                { name = 'path' },                              -- file paths
                { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
                { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
                { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
                { name = 'buffer', keyword_length = 2 },        -- source current buffer
                { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
                { name = 'luasnip' },
                { name = 'calc'},                               -- source for math calculation
            },

            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            formatting = {
                fields = {'menu', 'abbr', 'kind'},
                format = function(entry, item)
                    local menu_icon ={
                        nvim_lsp = 'λ',
                        vsnip = '⋗',
                        buffer = 'Ω',
                        path = '🖫',
                    }
                    item.menu = menu_icon[entry.source.name]
                    return item
                end,
            },
        })

    end
}
