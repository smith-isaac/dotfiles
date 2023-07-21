default_Port = "/dev/ttyACM0"
default_Baud = 115200
Serial_Monitor_Id = 0

vim.api.nvim_create_user_command("ArduinoSetPort", function()
    print('Available boards')
    List_ports()
    Port = vim.fn.input 'Enter port: '
    print('\nport set to ' .. Port)
end, {})

function Get_port()
    List_ports()
    return vim.fn.input('Select Port: ')
end

function List_ports()
    print(vim.cmd '!arduino-cli board list')
end

function List_boards()
    print(vim.cmd '!arduino-cli board listall')
end

function Attach_board()
    List_ports()
    local port = vim.fn.input 'Select Port: '
    List_boards()
    local board = vim.fn.input 'Select Board: '
    if not port or not board then
        print("failed to attach board")
        return
    end
    vim.cmd('!arduino-cli board attach -p ' .. port .. ' -b ' .. board)
end

vim.api.nvim_create_user_command("AttachBoard", Attach_board, {})

vim.api.nvim_create_user_command("SerialMonitor", function()
    Port = Auto_get_port()
    if not Port then
        Port = Get_port()
    end

    Baud = Auto_get_baud()
    if not Baud then
        Baud = default_Baud
    end

    vim.cmd 'vnew'
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    Serial_Monitor_Id = vim.fn.termopen("minicom -D " .. Port .. " -b " .. Baud, {
        on_exit = function()
            Serial_Monitor_Id = 0
            print("Serial monitor closed")
        end
    })
end, {})

vim.api.nvim_create_user_command("SendToSerialMonitor", function(opts)
    if Serial_Monitor_Id ~= 0 then

        local delim
        if string.len(opts.args) ~= 0 then
            delim = opts.args
        else
            delim = "\n"
        end

        if opts.range == 2 then
            for _,line in ipairs(vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)) do
                vim.api.nvim_chan_send(Serial_Monitor_Id, line .. delim)
            end
        else
            local str = vim.fn.input 'String to send to serial monitor: '
            vim.api.nvim_chan_send(Serial_Monitor_Id, str .. delim)
        end
    else
        print("Serial monitor not open")
    end
end, {range = true, nargs = "?"})

vim.api.nvim_create_user_command("SetupAutoCompile", function()

    vim.cmd 'vnew'
    local bufnr = vim.api.nvim_get_current_buf()
    local channel = vim.api.nvim_open_term(bufnr, {})
    vim.bo[bufnr].scrollback = 1

    local groupnr = vim.api.nvim_create_augroup("Arduino autocompile", {clear = true})

    local aucmd_id = vim.api.nvim_create_autocmd("BufWritePost", {
        group = groupnr,
        pattern = "*.ino",
        callback = function()

            local append_data = function(_,data)
                if data then
                    for _,line in ipairs(data) do
                        vim.api.nvim_chan_send(channel, line .. "\r\n")
                    end
                end
            end


            vim.api.nvim_chan_send(channel, "Compiling " .. vim.fn.expand('%') .. " and uploading\r\n")
            vim.fn.jobstart("arduino-cli compile -u", {
                stdout_buffered = true,
                on_stdout = append_data,
                on_stderr = append_data
            })
        end
    })

    vim.api.nvim_create_autocmd("BufHidden", {
        group = groupnr,
        buffer = bufnr,
        callback = function()
            vim.api.nvim_del_autocmd(aucmd_id)
        end
    })
end, {})

vim.api.nvim_create_user_command("ArduinoAutoCompile", function()

    vim.cmd 'vnew'
    local bufnr = vim.api.nvim_get_current_buf()
    local win = vim.api.nvim_get_current_win()
    vim.wo.number = false
    vim.wo.relativenumber = false

    local groupnr = vim.api.nvim_create_augroup("Arduino autocompile", {clear = true})

    local aucmd_id = vim.api.nvim_create_autocmd("BufWritePost", {
        group = groupnr,
        pattern = "*.ino",
        callback = function()

            local append_data = function(_,data)
                if data then
                    local data_no_empty = {}
                    for _,v in pairs(data) do
                        if v ~= "" then
                            data_no_empty[#data_no_empty+1] = v
                        end
                    end
                    vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data_no_empty)
                    vim.api.nvim_win_set_cursor(win, {vim.api.nvim_buf_line_count(bufnr), 0})
                    vim.bo[bufnr].modified = false
                end
            end


            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false,
                {"Compiling " .. vim.fn.expand('%') .. " and uploading"})
            vim.fn.jobstart("arduino-cli compile -u --no-color", {
                stdout_buffered = false,
                on_stdout = append_data,
                on_stderr = append_data
            })
        end
    })

    vim.api.nvim_create_autocmd("BufHidden", {
        group = groupnr,
        buffer = bufnr,
        callback = function()
            vim.api.nvim_del_autocmd(aucmd_id)
        end
    })
end, {})

function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

function lines_from(file)
    if not file_exists(file) then return {} end
    local lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = line
    end
    return lines
end

function Auto_get_port()
    local file = 'sketch.yaml'

    if not file_exists(file) then
        print("sketch.yaml not found")
        return nil
    end

    for line in io.lines(file) do
        _, _, port = string.find(line, "port: (%S+)")
        if port then return port end
    end
    print("port not found in sketch.yaml")
    return nil
end

function Auto_get_baud()
    local file = vim.fn.expand('%')

    for line in io.lines(file) do
        _, _, baud = string.find(line, "Serial.begin%((%d+)%)")
        if baud then
            return baud
        end
    end
    print("no \"Serial.begin\" call with baud rate")
    return nil
end

vim.api.nvim_create_user_command("GetSketchInfo", function()
    print("Port: " .. Auto_get_port())
    print("Baud: " .. Auto_get_baud())
end, {})
