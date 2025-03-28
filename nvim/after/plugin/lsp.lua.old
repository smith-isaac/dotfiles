local handlers = require("isaac.handlers")
handlers.setup()

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local servers = { 'solargraph', 'clangd', 'texlab', 'julials', 'vimls', 'lua_ls', 'bashls', 'pyright', 'csharp_ls', 'arduino_language_server', 'rust_analyzer', 'html'}

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

for _, lsp in ipairs(servers) do
    if lsp == 'texlab' then
        lspconfig[lsp].setup {
            settings = {
                texlab = {
                    auxDirectory = ".",
                    bibtexFormatter = "texlab",
                    build = {
                        args = { "-interaction=nonstopmode", "-synctex=1", "%f" },
                        executable = "pdflatex",
                        -- executable = "latexmk",
                        forwardSearchAfter = false,
                        onSave = false
                    },
                    chktex = {
                        onEdit = false,
                        onOpenAndSave = false
                    },
                    diagnosticsDelay = 300,
                    formatterLineLength = 80,
                    forwardSearch = {
                        args = {}
                    },
                    latexFormatter = "latexindent",
                    latexindent = {
                        modifyLineBreaks = false
                    }
                }
            },
            capabilities = handlers.capabilities,
            on_attach = handlers.on_attach
        }
    elseif lsp == 'lua_ls' then
        lspconfig[lsp].setup {
            -- settings = {
            --     Lua = {
            --       runtime = {
            --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            --         version = 'LuaJIT',
            --       },
            --       diagnostics = {
            --         -- Get the language server to recognize the `vim` global
            --         globals = {'vim'},
            --       },
            --       workspace = {
            --         -- Make the server aware of Neovim runtime files
            --         library = vim.api.nvim_get_runtime_file("", true),
            --       },
            --       -- Do not send telemetry data containing a randomized but unique identifier
            --       telemetry = {
            --         enable = false,
            --       },
            --     },
            --   },
            on_init = function(client)
                local path = client.workspace_folders[1].name
                if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                  client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                    Lua = {
                      runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT'
                      },
                      -- Make the server aware of Neovim runtime files
                      workspace = {
                        checkThirdParty = false,
                        library = {
                          vim.env.VIMRUNTIME
                          -- "${3rd}/luv/library"
                          -- "${3rd}/busted/library",
                        }
                        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                        -- library = vim.api.nvim_get_runtime_file("", true)
                      }
                    }
                  })

                  client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                end
                return true
              end,
        capabilities = handlers.capabilities,
        on_attach = handlers.on_attach
      }
  elseif lsp == 'arduino_language_server' then
        lspconfig[lsp].setup {
            cmd = {
                "arduino-language-server",
                "-cli-config", "$HOME/.arduino15/arduino-cli.yaml",
                "-cli", "arduino-cli",
                "-clangd", "clangd",
                -- Toggle the line below to enable logging of the arduino language server for troubleshooting
                -- "-log"
            },
        capabilities = handlers.capabilities,
        on_attach = handlers.on_attach
        }
    elseif lsp == 'clangd' then
        lspconfig[lsp].setup {
            cmd = {
                'clangd',
                '--header-insertion=never'
            },
        capabilities = handlers.capabilities,
        on_attach = handlers.on_attach
        }
    else
    lspconfig[lsp].setup {
        capabilities = handlers.capabilities,
        on_attach = handlers.on_attach
    }
    end
end
