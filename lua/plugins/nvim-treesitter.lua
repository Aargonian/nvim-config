return {
    'nvim-treesitter/nvim-treesitter',  -- Enhanced Syntax Parsing and Highlighting
    dependencies = {
        'nvim-tree/nvim-web-devicons',  -- NERDFont icons for many plugins
    },
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = {
                "lua",
                "rust",
                "toml",
                "javascript",
                "python",
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting=false,
            },
            ident = { enable = true },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            }
        }
    end
}
