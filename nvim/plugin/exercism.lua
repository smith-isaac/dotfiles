
---@class ExercismSubcommand
---@field impl fun(args:string[], opts:table) The command implementation
---@field complete? fun(subcmd_arg_lead: string): string[] (optional) Command completions callback

---@type table<string, ExercismSubcommand>
local subcommand_tbl = {
    submit = {
        impl = function(args, opts)

            local submit_files = function(files_table)
                local cmd = {"exercism", "submit"}
                for _,file in ipairs(files_table) do
                    table.insert(cmd, file)
                end

                vim.system(cmd, {text = true}, function(obj)
                    if obj.code ~= 0 then
                        print(obj.stderr)
                    else
                        print(obj.stdout)
                    end
                end)
            end

            if (#args ~= 0) then
                submit_files(args)
                return
            end

            local current_dir = vim.fn.expand('%:p:h')
            local language_dir = string.match(current_dir, 'exercism/(%w+)/.*$')
            if not language_dir then
                vim.notify("Not in Exercism directory: " .. current_dir, vim.log.levels.ERROR)
                return
            end

            local language_submit_files = {
                ["csharp"] = function()

                    -- vim.system({ "fd", "-d", "1", "-t", "f", "-E", "*Tests.cs", "cs$" }, {text = true}, function(obj)
                    --     local files = string.match(obj.stdout, "(%S+)\n$")
                    --     print("Submitting files " .. files)
                    --     submit_files({files})
                    -- end)
                    local cs_file = vim.fn.expand('%')
                    print("Submitting file " .. cs_file)
                    submit_files({cs_file})
                end,
                ["rust"] = function ()
                    submit_files({"src/lib.rs", "Cargo.toml"})
                end,
                default = function()
                    vim.print("Language " .. language_dir .. " not configured")
                end
            }

            local language_action = language_submit_files[language_dir] or language_submit_files.default
            language_action()
        end
    },
    download = {
        impl = function(args, opts)
            -- Downloads exercism exercise

            local cmd = {"exercism", "download"}
            for _,arg in ipairs(args) do
                table.insert(cmd, arg)
            end

            vim.system(cmd, {text = true}, function(obj)
                if obj.code ~= 0 then
                    vim.print(obj.stderr)
                else
                    vim.print(obj.stdout)
                end
            end)

        end
    }
}

---@param opts table :h lua-guide-commands-create
local function exercism(opts)
    local fargs = opts.fargs
    local subcommand_key = fargs[1]

    local args = #fargs > 1 and vim.list_slice(fargs, 2, #fargs) or {}
    local subcommand = subcommand_tbl[subcommand_key]
    if not subcommand then
        vim.notify("Exercism: unknown command: " .. subcommand_key, vim.log.levels.ERROR)
        return
    end

    subcommand.impl(args, opts)
end

vim.api.nvim_create_user_command("Exercism", exercism, {
    nargs = "+",
    desc = "Exercism CLI commands",
    complete = function(arg_lead, cmdline, _)
        local subcmd_key, subcmd_arg_lead = cmdline:match("^['<,'>]*Exercism%s(%S+)%s(.*)$")
        if subcmd_key
            and subcmd_arg_lead
            and subcommand_tbl[subcmd_key]
            and subcommand_tbl[subcmd_key].complete
        then
            return subcommand_tbl[subcmd_key].complete(subcmd_arg_lead)
        end

        if cmdline:match("^['<,'>]*Exercism%s+%w*$") then
            local subcommand_keys = vim.tbl_keys(subcommand_tbl)
            return vim.iter(subcommand_keys)
            :filter(function(key)
                return key:find(arg_lead) ~= nil
            end)
            :totable()
        end
    end
})
