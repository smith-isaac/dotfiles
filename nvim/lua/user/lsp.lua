local handlers = require("user.handlers")

local server_settings = {
    {
        server = '*',
        settings = {
            capabilities = handlers.capabilities,
            on_attach = handlers.on_attach
        }
    },
    {
        server = 'arduino_language_server',
        settings = {
            cmd = {
                "arduino-language-server",
                "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
                -- "-cli", "arduino-cli",
                -- "-clangd", "clangd",
                -- Toggle the line below to enable logging of the arduino language server for troubleshooting
                -- "-log"
            }
        }
    },
    {
        server = 'lua_ls',
        settings = {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using (most
                            -- likely LuaJIT in the case of Neovim)
                            version = 'LuaJIT',
                            -- Tell the language server how to find Lua modules same way as Neovim
                            -- (see `:h lua-module-load`)
                            path = {
                                'lua/?.lua',
                                'lua/?/init.lua',
                            },
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME
                                -- Depending on the usage, you might want to add additional paths
                                -- here.
                                -- '${3rd}/luv/library'
                                -- '${3rd}/busted/library'
                            }
                            -- Or pull in all of 'runtimepath'.
                            -- NOTE: this is a lot slower and will cause issues when working on
                            -- your own configuration.
                            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
                            -- library = {
                                --   vim.api.nvim_get_runtime_file('', true),
                                -- }
                            }
                        })
                    end,
                    settings = {
                        Lua = {}
                    }
                }
            }
        }

        for _,server in ipairs(server_settings) do
            vim.lsp.config(server.server, server.settings)
        end

        vim.lsp.enable({'clangd', 'lua_ls', 'julials', 'bashls', 'arduino_language_server', 'csharp_ls' , 'pyright', 'texlab' })
