return {
    filetypes = { 'arduino' },
    cmd = {
        "arduino-language-server",
        -- "-cli-config", vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
        -- "-cli", "arduino-cli",
        -- "-clangd", "clangd",
        -- Toggle the line below to enable logging of the arduino language server for troubleshooting
        "-log"
    },
    capabilities = vim.empty_dict()
}
