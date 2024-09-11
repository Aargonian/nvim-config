return {
    'nvim-treesitter/nvim-treesitter',  -- Enhanced Syntax Parsing and Highlighting
    dependencies = {
        'nvim-tree/nvim-web-devicons',  -- NERDFont icons for many plugins
    },
    config = function()
        require('nvim-treesitter.install').cmopilers = { "zig" }
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "lua",
                "toml",
                "html",
                "css",
                "json",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting=false,
                disable = { "markdown" },
            },
            indent = { enable = true },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            }
        }
    end
}
