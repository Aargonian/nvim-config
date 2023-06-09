local map = vim.api.nvim_set_keymap

-- Determine what kind of project we have for the project management
local function determine_project_type(cwd)
    local project_files = {
        {name = "Cargo.toml", type = "rust"},
        {name = "main.c", type = "c"},
        {name = "main.cpp", type = "cpp"},
        {name = "main.py", type = "python"},
        {name = "Main.java", type = "java"},
    }

    for _, file in ipairs(project_files) do
        if vim.loop.fs_stat(cwd .. "/" .. file.name) then
            return file.type
        end
    end

    return "unknown"
end

-- Mostly default options but we also have our own "project management" section which handles them a bit specially...
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
            asdlkfjadfs
            search_by = 'title',
            sync_with_nvim_tree = 'true',
            on_project_selected = function(prompt_bufnr)
                local actions = require('telescope.actions')
                local state = require('telescope.actions.state')
                local cwd = state.get_selected_entry(prompt_bufnr).value
                vim.api.nvim_set_current_dir(cwd)
                actions.close(prompt_bufnr)

                -- Close all current buffers
                vim.cmd('confirm bufdo bd')

                local project_type = determine_project_type(cwd)
                local load_project

                if project_type == "rust" then
                    load_project = require("project-langs.lang-rust").load_project
                elseif project_type == "c" then
                    load_project = require("project-langs.lang-c").load_project
                elseif project_type == "cpp" then
                    load_project = require("project-langs.lang-cpp").load_project
                elseif project_type == "python" then
                    load_project = require("project-langs.lang-python").load_project
                elseif project_type == "java" then
                    load_project = require("project-langs.lang-java").load_project
                end

                if load_project then
                    load_project(cwd)
                else
                    vim.api.nvim_command('enew')
                end

                -- Store our new buffer to refocus after we toggle 'NvimTreeOpen'
                local buffer_number = vim.api.nvim_get_current_buf()

                -- Open NvimTree, Tagbar, and focus our new buffer
                vim.api.nvim_command('NvimTreeOpen')
                vim.api.nvim_command('TagbarOpen')
                vim.api.nvim_command('buffer ' .. buffer_number)
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
