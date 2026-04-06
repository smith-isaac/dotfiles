if vim.fn.has("win32") ~= 1 then
    return {
        {
            'nvim-treesitter/nvim-treesitter',
            lazy = false,
            build = ':TSUpdate'
        },
        { 'nvim-treesitter/nvim-treesitter-context', lazy = false },
    }
else
    return {}
end
