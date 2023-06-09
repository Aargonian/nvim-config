-- in [[ project-langs/lang-python.lua ]]

local M = {}
local common = require("project-langs.common")

function M.load_project(cwd)
    local main = common.find_file(cwd, "main.py")
    if main then
        vim.api.nvim_command('e ' .. main)
    else
        vim.api.nvim_command('enew')
    end
end

return M
