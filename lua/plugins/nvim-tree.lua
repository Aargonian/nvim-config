return {
    'nvim-tree/nvim-tree.lua',           -- Filetree plugin
    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },

    config = function()
        -- [ Config Options and Setup for nvim-tree ]
        local map = vim.api.nvim_set_keymap
        local g = vim.g
        local WIDTH_RATIO = 0.5
        local HEIGHT_RATIO = 0.8

        require('nvim-tree').setup{
            disable_netrw = true,
            hijack_netrw = true,
            update_cwd = true,

            filters = {
                custom = {
                    "node_modules",
                    "^.git$"
                }
            },

            view = {
                relativenumber = true,
                preserve_window_proportions = true,
                float = {
                    enable = false,
                    open_win_config = function()
                        local screen_w = vim.opt.columns:get()
                        local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                        local window_w = screen_w * WIDTH_RATIO
                        local window_h = screen_h * HEIGHT_RATIO
                        local window_w_int = math.floor(window_w)
                        local window_h_int = math.floor(window_h)
                        local center_x = (screen_w - window_w) / 2
                        local center_y = ((vim.opt.lines:get() - window_h) / 2)
                                       - vim.opt.cmdheight:get()

                        return {
                            border = "rounded",
                            relative = "editor",
                            row = center_y,
                            col = center_x,
                            width = window_w_int,
                            height = window_h_int,
                        }
                    end,
                }
            },

            hijack_directories = {
                enable = true,
                auto_open = true
            },

            update_focused_file = {
                enable = true,
                update_cwd = false,
                ignore_list = {}
            },

            git = {
                enable = true,
                ignore = false,
                timeout = 500
            },

            renderer = {
                highlight_git = true
            }
        }

        map('n', '<Leader>e', ':NvimTreeToggle<CR>', { silent = true })

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
