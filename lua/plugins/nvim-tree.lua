return {
    'nvim-tree/nvim-tree.lua',           -- Filetree plugin
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        -- [ Config Options and Setup for nvim-tree ]
        local map = vim.api.nvim_set_keymap
        local g = vim.g

        require('nvim-tree').setup{
            filters = {
                custom = {
                    "node_modules",
                    ".git/"
                }
            },
            view = {
                preserve_window_proportions = true
            },
            disable_netrw = true,
            hijack_netrw = true,
            update_cwd = true,
            hijack_directories = {
                enable = true,
                auto_open = true
            },
            update_focused_file = {
                enable = true,
                update_cwd = true,
                ignore_list = {}
            },
            git = {
                enable = true,
                ignore = true,
                timeout = 500
            },
            renderer = {
                highlight_git = true
            }
        }

        map('n', '<Leader>n', ':NvimTreeToggle<CR>', { silent = true })

        -- Disable netrw for nvim-tree
        g.loaded_netrw = 1
        g.loaded_netrwPlugin = 1

        g.nvim_tree_git_hl = 1
        g.nvim_tree_add_trailing = 0
        g.nvim_tree_highlight_opened_files = 1
        g.nvim_tree_indent_markers = 1
        g.nvim_tree_show_icons = {
            git = 1,
            folders = 1,
            files = 1,
            folder_arrows = 1
        }
    end
}
