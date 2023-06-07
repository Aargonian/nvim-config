local opt = vim.opt
local cmd = vim.api.nvim_command

opt.completeopt = {'menuone', 'noselect', 'noinsert'}
opt.shortmess = opt.shortmess + { c = true }
--vim.api.nvim_set_option('updatetime', 300)

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

require('fidget').setup()

-- [[ Rust ]]

-- Configure the LSP through rust-tools.nvim
local on_attach = function(client, bufnr)
    -- Hover Actions
    local keymap_opts = { buffer = buffer }
    vim.keymap.set('n', 'g[', vim.diagnostic.goto_prev, keymap_opts)
    vim.keymap.set('n', 'g]', vim.diagnostic.goto_next, keymap_opts)
    vim.keymap.set('n', 'ga', vim.lsp.buf.code_action, keymap_opts)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, keymap_opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, keymap_opts)
    vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, keymap_opts)
    vim.keymap.set('n', 'gD', vim.lsp.buf.type_definition, keymap_opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, keymap_opts)
    vim.keymap.set('n', 'g0', vim.lsp.buf.document_symbol, keymap_opts)
    vim.keymap.set('n', 'gW', vim.lsp.buf.workspace_symbol, keymap_opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, keymap_opts).set('n', '<Leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
end

local opts = {
    tools = {
        runnables = {
            use_telescope = true,
        },
        inlay_hints = {
            auto = true,
            show_parameter_hints = false,
            parameter_hints_prefix = '',
            other_hints_prefix = '',
        },
    },

    -- All the opts to send to nvim-lspconfig, overriding the defaults in rust-tools.nvim
    server = {
        on_attach = on_attach,
        settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    command = 'clippy',
                },
            },
        },
    },
}

require('rust-tools').setup(opts)

-- Setup Completion
local cmp = require('cmp')
cmp.setup({
    preselect = cmp.PreselectMode.None,
    snippet = {
        expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
        end,
    },
    mapping = {
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true,
        }),
    },

    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
})

vim.opt.updatetime = 100

local diag_float_grp = vim.api.nvim_create_augroup('DiagnosticFloat', {clear = true})
vim.api.nvim_create_autocmd('CursorHold', {
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end,
    group = diag_float_grp,
})

-- Autoformat on save using rust-analyzer
local format_sync_grp = vim.api.nvim_create_augroup('Format', {})
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.rs',
    callback = function()
        vim.lsp.buf.format({ timeout_ms = 200 })
    end,
    group = format_sync_grp
})
