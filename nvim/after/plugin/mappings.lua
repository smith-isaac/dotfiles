vim.keymap.set('n', '<leader>o', function() require("telescope.builtin").find_files() end)
vim.keymap.set('n', '<leader>fg', function() require("telescope.builtin").git_files() end)
vim.keymap.set('n', '<leader>fj', function() require("telescope.builtin").jumplist() end)
vim.keymap.set('n', '<leader>h', function() require("telescope.builtin").oldfiles() end)
vim.keymap.set('n', '<leader>fb', function() require("telescope").extensions.file_browser.file_browser() end)
vim.keymap.set('n', '<leader>g', ':Git<cr>')
