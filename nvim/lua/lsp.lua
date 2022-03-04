local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local servers = { 'solargraph', 'clangd', 'texlab', 'julials'}

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
            capabilities = capabilities,
        }
    else
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
    end
end

