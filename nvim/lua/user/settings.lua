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
if vim.fn.has("win32") == 1 then
    vim.opt.udir = os.getenv("LOCALAPPDATA") .. "/.undo//"
    vim.opt.backupdir = os.getenv("LOCALAPPDATA") .. "/.backup//"
else
    vim.opt.udir = os.getenv("HOME") .. "/.config/nvim/.undo//"
    vim.opt.backupdir = os.getenv("HOME") .. "/.config/nvim/.backup//"
end
vim.opt.backup = true
vim.opt.modeline = true
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.termguicolors = true

vim.opt.foldmethod = "syntax"

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

if vim.fn.has("win32") == 1 then
    vim.o.shell = "powershell"
    vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.o.shellredir = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode"
    vim.o.shellquote = ""
    vim.o.shellxquote = "" 
end
