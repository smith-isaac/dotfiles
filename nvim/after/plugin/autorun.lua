local function attach_to_buffer(output_bufnr, output_winnr, pattern, command)
    local group_id = vim.api.nvim_create_augroup(pattern .. " autorun", {clear = true})
    local autocmd_nr = vim.api.nvim_create_autocmd("BufWritePost", {
        group = group_id,
        pattern = pattern,
        callback = function()

            local append_data = function(_, data)
                if data then
                    vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
                    vim.api.nvim_win_set_cursor(output_winnr, {vim.api.nvim_buf_line_count(output_bufnr), 0})
                    vim.bo[output_bufnr].modified = false
                end
            end

            vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, {"Output of " .. vim.fn.expand('%') .. ":"})
            vim.fn.jobstart(command, {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data
            })
        end
    })

    vim.api.nvim_create_autocmd("BufHidden", {
        group = group_id,
        buffer = output_bufnr,
        callback = function()
            vim.api.nvim_del_autocmd(autocmd_nr)
        end
    })
end

vim.api.nvim_create_user_command("AutoRun", function()
    local pattern = vim.fn.input "Pattern: "
    local command = vim.split(vim.fn.input "Command: ", " ")

    vim.cmd 'vnew'
    local bufnr = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    vim.wo.number = false
    vim.wo.relativenumber = false

    attach_to_buffer(bufnr, win, pattern, command)
end, {})
