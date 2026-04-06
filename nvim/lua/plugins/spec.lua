return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd([[colorscheme tokyonight]])
        end
    },

    { 'vim-airline/vim-airline' },
    { 'vim-airline/vim-airline-themes' },
    { 'tpope/vim-fugitive' },
    { 'tpope/vim-surround' },
    { 'preservim/nerdcommenter' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { "rafamadriz/friendly-snippets" },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'JuliaEditorSupport/julia-vim' },
    { 'neovim/nvim-lspconfig' },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        'nvim-telescope/telescope.nvim', version = '*',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- optional but recommended
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        }
    },
    { "seblyng/roslyn.nvim",
        ---@module 'roslyn.config'
        ---@type RoslynNvimConfig
        opts = {
            filewatching = "off"
        }
},
    { "mfussenegger/nvim-dap" },
    { "mason-org/mason.nvim" },
}
