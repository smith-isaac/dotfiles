require("isaac.languages").tex()

vim.api.nvim_create_user_command("LaTeXAutoCompile", function()

    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("LaTeX Auto Compile", {clear = true}),
        pattern = vim.fn.expand('%:t'),
        callback = function()
            vim.cmd 'TexlabBuild'
        end
    })

end, {})
