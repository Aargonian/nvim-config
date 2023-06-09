-- [[ project-langs/common.lua ]]

local M = {}

function M.find_file(path, target)
    local scan_req, err = vim.loop.fs_scandir(path)
    if err ~= nil then
        return nil
    end
    local stat = vim.loop.fs_stat

    local function iter_dir(scan_req)
        while true do
            local name, typ = vim.loop.fs_scandir_next(scan_req)
            if name == nil then
                break
            end
            local full_path = path .. '/' .. name
            local attrs = stat(full_path)

            if attrs and attrs.type == 'file' and name == target then
                return full_path
            elseif attrs and attrs.type == 'directory' then
                local result = M.find_file(full_path, target)
                if result then return result end
            end
        end
    end
    return iter_dir(scan_req)
end

return M
