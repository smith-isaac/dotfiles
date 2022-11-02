local handlers = require("isaac.handlers")
handlers.setup()

-- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local servers = { 'solargraph', 'clangd', 'texlab', 'julials', 'vimls', 'bashls', 'sumneko_lua', 'pyright', 'csharp_ls'}

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
    elseif lsp == 'sumneko_lua' then
        lspconfig[lsp].setup {
            settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = runtime_path,
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
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
