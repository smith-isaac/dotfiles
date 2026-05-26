Default_Baud = 115200
Serial_Monitor_Id = 0

vim.api.nvim_create_user_command("ArduinoSerialMonitor", function()

    Baud = Auto_get_baud()
    if not Baud then
        Baud = Default_Baud
    end

    vim.cmd 'vnew'
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_win_set_buf(win, buf)
    Serial_Monitor_Id = vim.fn.jobstart("~/.config/nvim/scripts/serial_monitor.sh " .. Baud, {
        on_exit = function()
            Serial_Monitor_Id = 0
            print("Serial monitor closed")
        end,
        term = true
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

vim.api.nvim_create_user_command("ArduinoAutoCompile", function()

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
            vim.fn.jobstart("arduino-cli compile -u --no-color " .. vim.fn.expand('%'), {
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

local function file_exists(file)
    local f = io.open(file, "rb")
    if f then f:close() end
    return f ~= nil
end

function Auto_get_port(path)
    local file = path .. '/sketch.yaml'

    if not file_exists(file) then
        print("sketch.yaml not found")
        return nil
    end

    for line in io.lines(file) do
        local _, _, port = string.find(line, "port: (%S+)")
        if port then return port end
    end
    print("port not found in sketch.yaml")
    return nil
end

function Auto_get_baud()
    local file = vim.fn.expand('%')

    for line in io.lines(file) do
        local _, _, baud = string.find(line, "Serial.begin%((%d+)%)")
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


-- vim.api.nvim_create_user_command("AttachBoard", function() require("user.custom_functions").popup_cmd("julia ~/.config/nvim/scripts/attach_arduino.jl") end, {nargs = 0})
vim.api.nvim_create_user_command("AttachBoard", function()
    require("user.custom_functions").popup_cmd("~/.config/nvim/scripts/attach_arduino.sh " .. vim.fn.expand('%'), {})
    vim.cmd 'LspRestart'
end, {nargs = 0})

vim.api.nvim_create_user_command("WatchPorts", function()
    require("user.custom_functions").popup_cmd("~/.config/nvim/scripts/watch_serial.sh", {})
end, {nargs=0})

local function select_library_example(library)
    vim.system({ vim.fn.stdpath("config") .. "/scripts/arduino-get-library-examples", library }, { text = true }, function(obj)
        local examples = vim.split(obj.stdout, "\n", {trimempty = true})
        vim.schedule(function()
            vim.ui.select(examples, {
                prompt = "Select example:"
            }, function(choice)
                vim.print(('Selected "%s"'):format(choice))
                if not choice then
                    return
                end
                vim.schedule(function()
                    vim.cmd('vsplit ' .. choice)
                end)
            end)
        end)
    end)
end

vim.api.nvim_create_user_command("ArduinoExamples", function ()

    vim.system({ vim.fn.stdpath("config") .. "/scripts/arduino-get-libraries" }, { text = true }, function(obj)
        vim.schedule(function()
            local libraries = vim.split(obj.stdout, "\n", {trimempty = true})
            vim.ui.select(libraries, {
                prompt = 'Select Arduino Library:'
            }, function(choice)
                vim.print(('Selected "%s"'):format(choice))
                select_library_example(choice)
            end)
        end)
    end)

end, {nargs = 0})
