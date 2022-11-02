local M = {}

local function c_maps()
    vim.keymap.set('n', '<leader>mm', ':!make<cr>', {buffer = true})
    vim.keymap.set('n', '<leader>mt', ':!make test<cr>', {buffer = true})
    vim.keymap.set('n', '<leader>mc', ':!make clean<cr>', {buffer = true})
end

local function ViewPDF(file)
    local path = file .. ".pdf"
    print("Show " .. path)
    os.execute("xdg-open " .. path .. " 2> /dev/null")
end

local function Biber(file)
    local path = file .. ".bcf"
    print("Running biber on " .. path)
    vim.api.nvim_command("!biber " .. path)
    print("Done")
end

local function tex_maps()
    vim.keymap.set('n', '<leader>ll', ':TexlabBuild<cr>', {buffer = true})
    vim.keymap.set('n', '<leader>lv', function() ViewPDF(vim.fn.expand("%:r")) end, {buffer = true, silent = true})
    vim.keymap.set('n', '<leader>lb', function() Biber(vim.fn.expand("%:r")) end, {buffer = true})
    vim.opt_local.foldcolumn = '3'
end

M.c = c_maps
M.tex = tex_maps

return M
