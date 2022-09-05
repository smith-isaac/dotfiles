require'nvim-treesitter.configs'.setup {
    ensure_installed = {"c", "cpp", "json", "julia", "latex", "lua", "make", "markdown", "ruby", "python"},
    auto_install = true,
    highlight = {
        enable = true
    }
}
