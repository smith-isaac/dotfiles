local M = {}

function M.jq_query(opts)

    local query_path = vim.fs.joinpath(vim.fn.expand('%:h'), 'jq_query.txt')
    local query_abs_path = vim.fn.fnamemodify(query_path, ':p')
    local query_path_escaped = vim.fn.shellescape(query_abs_path)

    local find_win_by_path = require("tools.utils").find_win_by_path

    local current_win = vim.api.nvim_get_current_win()

    local query_win = find_win_by_path(query_abs_path)
    if not query_win then
        vim.cmd('split ' .. query_abs_path)
        vim.cmd('silent write')
        vim.api.nvim_set_current_win(current_win)
    end


    local outfile = vim.fn.stdpath 'data' .. '/jq_out.json'
    local outfile_abs_path = vim.fn.fnamemodify(outfile, ':p')
    local outfile_path_escaped = vim.fn.shellescape(outfile_abs_path)

    local cmd

    if opts.fargs[1] == 'raw' then
        cmd = 'jq -r -f ' .. query_path_escaped .. ' > ' .. outfile_path_escaped
    else
        cmd = 'jq -f ' .. query_path_escaped .. ' > ' .. outfile_path_escaped
    end

    vim.cmd(string.format("silent %d,%dwrite !%s", opts.line1, opts.line2, cmd))

    local out_win = find_win_by_path(outfile_abs_path)

    if out_win then
        vim.api.nvim_set_current_win(out_win)
        vim.cmd('noautocmd edit')
    else
        vim.cmd('vsplit ' .. outfile_abs_path)
    end
    vim.api.nvim_set_current_win(current_win)

end

function M.setup(buf_nr)
    vim.api.nvim_buf_create_user_command(buf_nr, 'RunJQ', M.jq_query, {range = '%', nargs = '?'})
    vim.api.nvim_buf_set_keymap(buf_nr, 'v', '<leader>p', ':RunJQ<CR>', {silent = true, desc = 'Run JQ selection' })
    vim.api.nvim_buf_set_keymap(buf_nr, 'n', '<leader>p', ':RunJQ<CR>', {silent = true, desc = 'Run JQ selection' })
end

return M
