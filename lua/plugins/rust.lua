return {
    { 'neovim/nvim-lspconfig' },
    { 'mfussenegger/nvim-dap' },
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = { commented = true },
      dependencies = { 'mfussenegger/nvim-dap' },
    },
    {
        'rcarriga/nvim-dap-ui',
        opts = {},
        dependencies = {
            'mfussenegger/nvim-dap',
            'nvim-neotest/nvim-nio',
        },
        config = function(_, opts)
            local dap, dapui = require('dap'), require('dapui')
            dapui.setup(opts)

            -- auto-open / auto-close
            dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
            dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
            dap.listeners.before.event_exited['dapui_config']     = function() dapui.close() end

            -- Rust DAP Keys
            local dap = require('dap')
            vim.keymap.set('n', '<leader>dc', dap.continue)         -- Continue / start
            vim.keymap.set('n', '<leader>dn', dap.step_over)        -- Next
            vim.keymap.set('n', '<leader>di', dap.step_into)        -- Into
            vim.keymap.set('n', '<leader>do', dap.step_out)         -- Out
            vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
            vim.keymap.set('n', '<leader>dB', function()            -- conditional BP
                dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
            end)
            vim.keymap.set('n', '<leader>dr', dap.repl.toggle)
            vim.keymap.set('n', '<leader>du', require('dapui').toggle)

            -- Expression under cursor → watch list
            vim.keymap.set('n', '<leader>dw', function()
              require('dapui').elements.watches.add()
            end)

            -- Peek value in a floating window (like VS Code hover)
            vim.keymap.set({'n','v'}, '<leader>dh', function()
              require('dap.ui.widgets').hover()
            end)
        end
    },
    {
        'mrcjkb/rustaceanvim',          -- Tools to make rust-analyzer LSP better
        event = "LspAttach",
        version = '^6',
        ft = { 'rust' },
        config = function()
            local rt = require('rustaceanvim.config')
            vim.g.rustaceanvim = {
                server = {
                    settings = {
                        ['rust-analyzer'] = {
                            check = {
                                command = "clippy",
                            }
                        }
                    }
                },

                dap = {
                    adapter = rt.get_codelldb_adapter(
                      vim.fn.stdpath('data') .. '/mason/bin/codelldb',
                      vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/lldb/lib/liblldb.dylib'
                    ),
                }
            }
        end
    },
}
