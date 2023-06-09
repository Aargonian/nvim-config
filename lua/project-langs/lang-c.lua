-- in [[ project-langs/lang-c.lua ]]

local M = {}
local common = require("project-langs.common")

local function strip_comments(content)
    content = content:gsub("//.-\n", "\n")
    content = content:gsub("/%*.-%*/", "")
    return content
end

local function contains_main_func(file_path)
    local file = io.open(file_path, "r")
    if file then
        local content = file:read("*all")
        file:close()
        content = strip_comments(content)
        return content:find("int%s+main%s*%(") ~= nil or content:find("void%s+main%s*%(") ~= nil
    end
    return false
end

function M.load_project(cwd)
    local main_file = common.find_file(cwd, "main.c")
    if main_file  and contains_main_func(main_file) then
        vim.api.nvim_command('e ' .. main_c)
        return
    end

    -- No valid main file found. Open a new buffer.
    vim.api.nvim_command('enew')
end

return M
