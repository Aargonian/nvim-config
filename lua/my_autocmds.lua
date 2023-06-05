local M = {}

function M.bufenter()
    local cur_win = vim.api.nvim_get_current_win()
    local cur_buf = vim.api.nvim_get_current_buf()
    local bufs = vim.api.nvim_list_bufs()

    for _, buf in ipairs(bufs) do
        if vim.api.nvim_buf_is_valid(buf) and buf ~= cur_buf then
            local win_ids = vim.fn.win_findbuf(buf)
            for _, win_id in ipairs(win_ids) do
                if win_id == cur_win then
                    vim.api.nvim_buf_delete(buf, { force = false })
                end
            end
        end
    end
end

return M
