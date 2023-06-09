-- in [[ project-langs/lang-java.lua ]]

local M = {}
local common = require("project-langs.common")

function M.load_project(cwd)
    local main = common.find_file(cwd, "main.java")
    if main then
        vim.api.nvim_command('e ' .. main)
    else
        local main = common.find_file(cwd, "Main.java")
        if main then
            vim.api.nvim_command('e ' .. main)
        else
            vim.api.nvim_command('enew')
        end
    end
end

return M
