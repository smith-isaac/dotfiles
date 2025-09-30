local M = {}

function M.find_win_by_path(abs_path)
    for _,win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local name = vim.api.nvim_buf_get_name(buf)
        if name == abs_path then
            return win
        end
    end
    return nil
end


return M
