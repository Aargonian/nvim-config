return {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            keymaps = {
                normal = "<Leader>s",
                normal_cur = "<Leader>ss",
                normal_line = "<Leader>s",
                normal_cur_line = "<Leader>sS",
                visual = "<Leader>S",
                visual_line = "<Leader>gS",
                delete = "<Leader>ds",
                change = "<Leader>cs",
                change_line = "<Leader>cS",
            },
        })
    end
}
