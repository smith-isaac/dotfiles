local M = {}

local function c_maps()
    vim.keymap.set('n', '<leader>mm', ':!make<cr>', {buffer = true})
    vim.keymap.set('n', '<leader>mt', ':!make test<cr>', {buffer = true})
    vim.keymap.set('n', '<leader>mc', ':!make clean<cr>', {buffer = true})

    -- Pico keybindings should only work under a top-level folder named 'Pico'
    if string.match(vim.fn.expand('%:p'), 'Pico') then
        Pico_Port = "/dev/ttyACM0"
        vim.api.nvim_create_user_command("PicoBuild", function()
            vim.cmd 'vnew'
            local bufnr = vim.api.nvim_get_current_buf()
            local win = vim.api.nvim_get_current_win()
            vim.wo.number = false
            vim.wo.relativenumber = false

            local group_id = vim.api.nvim_create_augroup("Pico auto make", {clear = true})
            local autocmd_nr = vim.api.nvim_create_autocmd("BufWritePost", {
                group = group_id,
                pattern = "*.c",
                callback = function()
                    local append_data = function(_, data)
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

                    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"Building " .. vim.fn.expand('%') .. ":"})
                    vim.fn.jobstart("if [ -d build ]; then cd build && make ; else echo \"Please run Cmake first\" ; fi", {
                        stdout_buffered = false,
                        on_stdout = append_data,
                        on_stderr = append_data
                    })
                end
            })

            vim.api.nvim_create_autocmd("BufHidden", {
                group = group_id,
                buffer = bufnr,
                callback = function()
                    vim.api.nvim_del_autocmd(autocmd_nr)
                end
            })
        end, {})

        vim.api.nvim_create_user_command("PicoListPorts", function()
            print(vim.cmd("!julia -e 'using LibSerialPort;list_ports()'"))
        end, {})

        vim.api.nvim_create_user_command("PicoSetPort", function()
            print(vim.cmd("!julia -e 'using LibSerialPort;list_ports()'"))

            local ports_str = vim.fn.system("julia -e 'using LibSerialPort; for port in get_port_list() println(port) end'")

            local ports = {}
            for s in string.gmatch(ports_str, "[^\r\n]+") do
                table.insert(ports, s)
            end

            for k,v in pairs(ports) do
                print(k .. ': ' .. v)
            end

            local port_num = vim.fn.input('Select Port: ')

            if ports[port_num] then
                Pico_Port = ports[port_num]
            end
        end, {})

        vim.api.nvim_create_user_command("PicoSerialMonitor", function()
            vim.cmd 'vnew'
            local win = vim.api.nvim_get_current_win()
            local buf = vim.api.nvim_create_buf(true, true)
            vim.api.nvim_win_set_buf(win, buf)
            vim.fn.termopen("minicom -D " .. Pico_Port .. " -b 115200", {
                on_exit = function()
                    print("Serial monitor closed")
                end
            })
        end, {})
    end
end

local function cmake_maps()
    vim.api.nvim_create_user_command("CmakeBuild", function()
        vim.cmd 'vnew'
        local bufnr = vim.api.nvim_get_current_buf()
        local win = vim.api.nvim_get_current_win()
        vim.wo.number = false
        vim.wo.relativenumber = false

        local group_id = vim.api.nvim_create_augroup("Cmake auto build", {clear = true})
        local autocmd_nr = vim.api.nvim_create_autocmd("BufWritePost", {
            group = group_id,
            pattern = "CMakeLists.txt",
            callback = function()
                local append_data = function(_, data)
                    if data then
                        vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
                        vim.api.nvim_win_set_cursor(win, {vim.api.nvim_buf_line_count(bufnr), 0})
                        vim.bo[bufnr].modified = false
                    end
                end

                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {"Building cmake"})
                vim.fn.jobstart("mkdir -p build ; cd build ; rm -rf * ; cmake ..", {
                    stdout_buffered = true,
                    on_stdout = append_data,
                    on_stderr = append_data
                })
            end
        })

        vim.api.nvim_create_autocmd("BufHidden", {
            group = group_id,
            buffer = bufnr,
            callback = function()
                vim.api.nvim_del_autocmd(autocmd_nr)
            end
        })
    end, {})
end

local function ViewPDF(file)
    local path = file .. ".pdf"
    print("Show " .. path)
    os.execute("xdg-open " .. path .. " 2> /dev/null")
end

local function Biber(file)
    local path = file .. ".bcf"
    print("Running biber on " .. path)
    vim.api.nvim_command("!biber " .. path)
    print("Done")
end

local function tex_maps()
    vim.keymap.set('n', '<leader>ll', ':TexlabBuild<cr>', {buffer = true})
    vim.keymap.set('n', '<leader>lv', function() ViewPDF(vim.fn.expand("%:r")) end, {buffer = true, silent = true})
    vim.keymap.set('n', '<leader>lb', function() Biber(vim.fn.expand("%:r")) end, {buffer = true})
    vim.opt_local.foldcolumn = '3'
end

local function lua_maps()
    vim.keymap.set('n', '<leader>x', ':source %<cr>', {buffer = true})
end

local function rust_maps()
    if string.match(vim.fn.expand('%:p'), 'exercism/.*/src') then
        vim.keymap.set('n', '<leader>es', function()
            local path = vim.fn.expand('%:p:h') .. '/*.rs'
            local other_files = vim.fn.input 'Additional files to submit: '
            if other_files ~= "" then
                vim.cmd('!exercism submit ' .. path .. " " .. other_files)
            else
                vim.cmd('!exercism submit ' .. path)
            end
        end, {buffer = true})
    end
end

local function julia_maps()
    -- if Julia_REPL_id == nil then
    --     Julia_REPL_id = 0
    -- end

    local function start_REPL()
        vim.cmd 'vnew'
        local win = vim.api.nvim_get_current_win()
        local buf = vim.api.nvim_create_buf(true, true)
        vim.api.nvim_win_set_buf(win, buf)
        Julia_REPL_id = vim.fn.termopen("julia", {
            on_exit = function()
                Julia_REPL_id = nil
                print("Julia REPL closed")
            end
        })
    end

    vim.api.nvim_create_user_command("REPL", function() start_REPL() end, {})

    local function write_to_repl(cmd)
        if Julia_REPL_id ~= nil then
            vim.api.nvim_chan_send(Julia_REPL_id, cmd .. "\n")
        end
    end

    local function run_file_in_repl(file)
        if Julia_REPL_id == nil then
            start_REPL()
        end
        vim.api.nvim_chan_send(Julia_REPL_id, "include(\"" .. file .. "\")\n")
    end

    vim.keymap.set('n', '<leader>r', function() run_file_in_repl(vim.fn.expand('%')) end, {buffer = true})

end

M.c = c_maps
M.tex = tex_maps
M.lua = lua_maps
M.rust = rust_maps
M.cmake = cmake_maps
M.julia = julia_maps

return M
