local M = {}

local function popup_window_command(cmd)
    local win_height = math.ceil(vim.o.lines * 0.5)
    local win_width = math.ceil(vim.o.columns * 0.5)
    local x_pos = math.ceil((vim.o.lines - win_height) * 0.5)
    local y_pos = math.ceil((vim.o.columns - win_width) * 0.5)

    local win_opts = {
        border = "rounded",
        relative = "editor",
        style = "minimal",
        width = win_width,
        height = win_height,
        row = x_pos,
        col = y_pos
    }

    local buf = vim.api.nvim_create_buf(false, true)
    local win = vim.api.nvim_open_win(buf, true, win_opts)

    vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
    vim.api.nvim_win_set_option(win, "winblend", 50)

    local keymaps_opts = {
        silent = true,
        buffer = buf
    }

    vim.keymap.set('n', "q", function() vim.api.nvim_win_close(win, true) end, keymaps_opts)
    vim.keymap.set('n', "<ESC>", function() vim.api.nvim_win_close(win, true) end, keymaps_opts)

    vim.fn.termopen(cmd)
end

M.popup_cmd = popup_window_command

return M
