return {
    -- [[ Telescope Navigation ]]
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
        }
    },

    {
        'Aargonian/telescope-fzf-native.nvim',
        --build = 'make',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },

    'nvim-telescope/telescope-file-browser.nvim',
    {
        'nvim-telescope/telescope-project.nvim',
        config = function()
            local map = vim.api.nvim_set_keymap

            -- Set actions for the later keybinds
            local actions = require("telescope.actions")

            -- Mostly default options but we also have our own "project management" section which handles them a bit specially...
            require('telescope').setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        }
                    }
                },
                pickers = {
                    find_files = {
                        file_ignore_patterns = {
                            ".git"
                        },
                        hidden = true
                    }
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                    -- false will only do exact matching
                        override_generic_sorter = true,  -- override the generic sorter
                        override_file_sorter = true,     -- override the file sorter
                        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                        -- the default case_mode is "smart_case"
                    },
                    project = {
                        base_dirs = {
                            '~',
                            '~/Projects',
                        },
                        ignore_missing_dirs = true,
                        hidden_files = true,
                        theme = 'dropdown',
                        order_by = 'asc',
                        search_by = 'title',
                        sync_with_nvim_tree = 'true',
                        --on_project_selected = function(prompt_bufnr)
                        --    vim.api.nvim_command('enew')
                        --end,
                    }
                }
            }
            -- To get fzf loaded and working with telescope, you need to call
            -- load_extension, somewhere after setup function:
            require('telescope').load_extension('fzf')
            require('telescope').load_extension('project')

            map('n', '<Leader>ff', ':Telescope find_files<CR>', {silent = true})
            map('n', '<Leader>ft', ':Telescope live_grep<CR>', {silent = true})
        end
    }
}
