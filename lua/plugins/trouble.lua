return {
    "folke/trouble.nvim",
    tag = "v3.6.0",
    event = "LspAttach",
    priority = 2000,
    opts = {
        modes = {
            diagnostics = {
                auto_open = false,
                auto_close = false,
                open_no_results = true,
            },
            lsp_document_symbols = {
                auto_open = false,
                auto_close = false,
                open_no_results = true,
                win = {
                    type = "split",
                    relative = "editor",
                    position = "right",
                    size = { width = 40, height = 16 },
                },
            }
        },
    },
    cmd = "Trouble",
    keys = {
        {
          "<leader>x",
          "<cmd>Trouble diagnostics toggle focus=false<cr>",
            desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>c",
          "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)",
        },
        -- {
        --   "<leader>c",
        --   "<cmd>Trouble lsp_document_symbols toggle focus=false<cr>",
        --     desc = "Symbols (Trouble)",
        -- },
        -- {
        --   "<leader>xX",
        --   "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        --     desc = "Buffer Diagnostics (Trouble)",
        -- },
        -- {
        --   "<leader>cl",
        --   "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        --     desc = "LSP Definitions / references / ... (Trouble)",
        -- },
        -- {
        --   "<leader>xL",
        --   "<cmd>Trouble loclist toggle<cr>",
        --     desc = "Location List (Trouble)",
        -- },
        -- {
        --   "<leader>xQ",
        --   "<cmd>Trouble qflist toggle<cr>",
        --     desc = "Quickfix List (Trouble)",
        -- },
    },
}
