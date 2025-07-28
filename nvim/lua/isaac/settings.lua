vim.opt.expandtab = true
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8


vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.hidden = true
vim.opt.spell = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.lcs = "trail:·,tab:>-"
vim.opt.udf = true
vim.opt.udir = os.getenv("HOME") .. "/.config/nvim/.undo//"
vim.opt.backup = true
vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/.backup//"
vim.opt.modeline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.cot = "menu,menuone,noselect"
vim.api.nvim_command "let g:airline_theme='deus'"

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_preview = 1
vim.g.netrw_winsize = 30

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.opt_local.nu = false
        vim.opt_local.rnu = false
        vim.opt_local.spell = false
        vim.cmd('startinsert')
    end
})
