vim.keymap.set('n', '<leader>o', function() require("telescope.builtin").find_files() end)
vim.keymap.set('n', '<leader>fg', function() require("telescope.builtin").git_files() end)
vim.keymap.set('n', '<leader>fj', function() require("telescope.builtin").jumplist() end)
vim.keymap.set('n', '<leader>h', function() require("telescope.builtin").oldfiles() end)
vim.keymap.set('n', '<leader>g', ':Git<cr>')

function live_grep_git_dir()
    local git_dir = vim.fn.system(string.format("git -C %s rev-parse --show-toplevel", vim.fn.expand("%:p:h")))
    git_dir = string.gsub(git_dir, "\n", "")
    local opts = {
        cwd = git_dir,
    }
    require('telescope.builtin').live_grep(opts)
end

vim.keymap.set('n', '<leader>fG', live_grep_git_dir)
