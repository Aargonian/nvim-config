-- in [[ project-langs/lang-rust.lua ]]

local M = {}
local common = require("project-langs.common")

local function contains_workspace(file_path)
    local file = io.open(file_path, "r")
    if file then
        local content = file:read("*all")
        file:close()
        return content:find("%[workspace%]") ~= nil
    end
    return false
end

local function find_workspace_members(cargo_toml_path)
    local file = io.open(cargo_toml_path, "r")
    local members = {}
    if file then
        local is_workspace_section = false
        for line in file:lines() do
            if line:match("^%s*%[workspace%]") then
                is_workspace_section = true
            elseif is_workspace_section and line:match("^%s*members%s*=%s*%[") then
                for member in line:gmatch('"([^"]+)"') do
                    table.insert(members, member)
                end
                break
            end
        end
        file:close()
    end
    return members
end

function M.load_project(cwd)
    -- Check for Cargo.toml
    local cargo_toml = common.find_file(cwd, "Cargo.toml")
    if cargo_toml then
        local members
        if contains_workspace(cargo_toml) then
            -- If it's a workspace, read the first member
            members = find_workspace_members(cargo_toml)
        end

        local project_path = cwd
        if members and #members > 0 then
            project_path = cwd .. '/' .. members[1]
        end

        -- Try to find 'main.rs' under 'src' or 'lib.rs' under 'src'
        local main_file = common.find_file(project_path, "main.rs") or common.find_file(project_path, "lib.rs")
        if main_file then
            vim.api.nvim_command('e ' .. main_file)
        else
            vim.api.nvim_command('enew')  -- Open a new empty buffer if no main.rs or lib.rs was found
        end

    else
        vim.api.nvim_command('enew')  -- Open a new empty buffer if not a Rust project
    end
end

return M
