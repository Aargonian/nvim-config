return {
    'backdround/global-note.nvim', -- Session Manager

    config = function()
        local global_note = require("global-note")
        local get_project_name = function()
            -- Start from the directory of the current buffer
            local dir = vim.fn.expand("%:p:h")
            if dir == "" then
                return "NoProject"
            end

            -- Loop until we reach the filesystem root
            local prev = ""
            while dir ~= prev do
                if vim.fn.isdirectory(dir .. "/.git") == 1 then
                    return vim.fn.fnamemodify(dir, ":t") -- basename
                end
                prev = dir
                dir  = vim.fn.fnamemodify(dir, ":h") -- move one level up
            end

            return "NoProject"
        end

        global_note.setup({
            filename = "inbox.md",
            directory = "~/Documents/The Vault/0 - Meta",
            title = "Inbox Note",
            command_name = "InboxNote",

            window_config = function()
                local window_height = vim.api.nvim_list_uis()[1].height
                local window_width = vim.api.nvim_list_uis()[1].width
                return {
                    relative = "editor",
                    border = "single",
                    title = "Note",
                    title_pos = "center",
                    width = math.floor(0.7 * window_width),
                    height = math.floor(0.85 * window_height),
                    row = math.floor(0.05 * window_height),
                    col = math.floor(0.15 * window_width),
                }
            end,

            -- It's called after the window creation.
            -- fun(buffer_id: number, window_id: number)
            post_open = function(_, _) end,

            -- Whether to use autosave. Autosave saves buffer on closing window
            -- or exiting Neovim.
            -- boolean
            autosave = true,

            -- Additional presets to create other global, project local, file local
            -- and other notes.
            -- { [name]: table } - tables there have the same fields as the current table.
            additional_presets = {
                project = {
                    title = function()
                        return "Project Note - " .. get_project_name() .. ".md"
                    end,

                    command_name = "ProjectNote",

                    filename = function()
                        return get_project_name() .. ".md"
                    end,

                    directory = function()
                        return "~/Documents/The Vault/3 - Projects/7 - Programming/" .. get_project_name()
                    end,
                },

                todo = {
                    title = "Todo",
                    command_name = "TodoNote",
                    filename = "todo.md",
                },
            },
        })

        vim.keymap.set("n", "<leader>oni", global_note.toggle_note)
        vim.keymap.set("n", "<leader>onp", function() global_note.toggle_note("project") end)
        vim.keymap.set("n", "<leader>ont", function() global_note.toggle_note("todo") end)
    end
}
