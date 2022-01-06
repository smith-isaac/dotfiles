local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')

local servers = { 'solargraph', 'clangd', 'texlab'}

for _, lsp in ipairs(servers) do
    if lsp == 'arduino_language_server' then
        lspconfig[lsp].setup {
            cmd =  {
	    -- Required
	    "arduino-language-server",
	    "-cli-config", "/path/to/arduino-cli.yaml",
	    -- Optional
	    "-cli", "/path/to/arduino-cli",
	    "-clangd", "/path/to/clangd"
	    },
	    capabilities = capabilities,
	}
    else
    lspconfig[lsp].setup {
        capabilities = capabilities,
    }
    end
end

