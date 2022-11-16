Port = "/dev/ttyACM0"
Baud = 115200
Serial_Monitor_Id = 0

vim.api.nvim_create_user_command("ArduinoSetPort", function()
    print('Available boards')
    List_ports()
    Port = vim.fn.input 'Enter port: '
    print('\nport set to ' .. Port)
end, {})

function File_exists(file)
    local f = io.open(file, "r")
    if f then f:close() end
    return f ~= nil
end

function Get_port()
    List_ports()
    return vim.fn.input('Select Port: ')
end

function Auto_get_port(file)
    return string.sub(vim.json.decode(table.concat(vim.fn.readfile(file), "")).cpu.port, 10, -1)
end

function List_ports()
    print(vim.cmd '!arduino-cli board list')
end

function Attach_board()
    List_ports()
    Port = vim.fn.input 'Select Port: '
    vim.cmd('!arduino-cli board attach -p ' .. Port)
end

vim.api.nvim_create_user_command("AttachBoard", Attach_board, {})

vim.api.nvim_create_user_command("SerialMonitor", function()
    if File_exists("./sketch.json") then
        Port = Auto_get_port("./sketch.json")
    else
        Port = Get_port()
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
