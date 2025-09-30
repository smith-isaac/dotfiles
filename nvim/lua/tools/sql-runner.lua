local M = {}

function M.sql_query(opts)
    local outfile = vim.fn.stdpath 'data' .. '/sql_out.txt'
    local outfile_abs_path = vim.fn.fnamemodify(outfile, ':p')
    local outfile_path_escaped = vim.fn.shellescape(outfile_abs_path)

    if not vim.env.DBPATH then
        print("No db path set")
        return
    end

    local db_path_escaped = vim.fn.shellescape(vim.env.DBPATH)

    local cmd = 'sqlite3 -header -column ' .. db_path_escaped .. ' > ' .. outfile_path_escaped

    vim.cmd(string.format("silent %d,%dwrite !%s", opts.line1, opts.line2, cmd))

    local out_win = require("tools.utils").find_win_by_path(outfile_abs_path)
    local current_win = vim.api.nvim_get_current_win()

    if out_win then
        vim.api.nvim_set_current_win(out_win)
        vim.cmd('noautocmd edit')
    else
        vim.cmd('split ' .. outfile_abs_path)
    end
    vim.api.nvim_set_current_win(current_win)
end

function M.setup(buf_nr)
    vim.api.nvim_buf_create_user_command(buf_nr, 'RunSQL', M.sql_query, {range = '%'})
    vim.api.nvim_buf_set_keymap(buf_nr, 'v', '<leader>p', ':RunSQL<CR>', {silent = true, desc = 'Run selected SQL query'})
    vim.api.nvim_buf_set_keymap(buf_nr, 'n', '<leader>p', ':RunSQL<CR>', {silent = true, desc = 'Run selected SQL query'})
end

return M
