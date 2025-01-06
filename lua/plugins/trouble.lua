return {
    'folke/trouble.nvim',
    tag = "v3.6.0",
    opts = {
        modes = {
            diagnostics = {
                auto_open = true,
            },
        },
    },
    cmd = "Trouble",
    keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
    }
}
