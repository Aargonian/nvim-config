local map = vim.api.nvim_set_keymap

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
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
                '~/Programming'
            },
            hidden_files = true,
            theme = 'dropdown',
            order_by = 'asc',
            search_by = 'title',
            sync_with_nvim_tree = 'true',
            on_project_selected = function (prompt_bufnr)
                local actions = require('telescope.actions')
                local state = require('telescope.actions.state')
                local cwd = state.get_selected_entry(prompt_bufnr).value
                vim.api.nvim_set_current_dir(cwd)

                -- Close the Telescope prompt
                actions.close(prompt_bufnr)

                -- Close all existing buffers
                vim.cmd('confirm bufdo bd')

                -- Open NvimTree at the project root
                vim.cmd("NvimTreeOpen")

                local cargo_toml = cwd .. "/Cargo.toml"
                if vim.loop.fs_stat(cargo_toml) then
                    local main_rs = cwd .. "/src/main.rs"
                    local lib_rs = cwd .. "/src/lib.rs"

                    if vim.loop.fs_stat(main_rs) then
                        vim.api.nvim_command('e ' .. main_rs)
                    elseif vim.loop.fs_stat(lib_rs) then
                        vim.api.nvim_command('e ' .. lib_rs)
                    else
                        vim.api.nvim_command('enew')
                    end

                    local buffer_number = vim.api.nvim_get_current_buf()

                    -- Open Tagbar
                    vim.api.nvim_command('TagbarOpen')

                    -- Refocus our new buffer
                    vim.api.nvim_command('buffer ' .. buffer_number)
                else
                    vim.api.nvim_command('enew')
                end
            end
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')

map('n', '<Leader>ff', ':Telescope find_files<CR>', {silent = true})
map('n', '<Leader>ft', ':Telescope live_grep<CR>', {silent = true})
