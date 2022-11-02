vim.keymap.set('n', '<leader>ft', ':set filetype?<CR>')
vim.keymap.set('n', '<leader>ve', ':edit $XDG_CONFIG_HOME/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>vr', ':source $XDG_CONFIG_HOME/nvim/init.lua<CR>')
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>', {silent = true})

vim.keymap.set('n', '<leader><TAB>', ':tabe<CR>')
vim.keymap.set('n', '<leader>gf', ':edit <cfile><CR>')
vim.keymap.set('n', '<leader>nf', ':enew<cr>')
vim.keymap.set('n', '<leader>d', ':pwd<cr>')

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

vim.keymap.set('v', '<leader>p', '"_dP')

-- Split
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- Resizing
vim.keymap.set('n', '<C-->', '<C-w>-')
vim.keymap.set('n', '<C-=>', '<C-w>+')

-- Tabs
vim.keymap.set('n', '<C-Left>', 'gT')
vim.keymap.set('n', '<C-Right>', 'gt')
vim.keymap.set('n', '<S-Left>', ':-tabmove<cr>')
vim.keymap.set('n', '<S-Right>', ':+tabmove<cr>')

-- Buffers
vim.keymap.set('n', '<leader>bb', ':ls<cr>')
vim.keymap.set('n', '<leader>bn', ':bn<cr>')
vim.keymap.set('n', '<leader>bp', ':bp<cr>')
vim.keymap.set('n', '<leader>bq', ':bd<cr>')

-- Terminal mappings
vim.keymap.set('n', '<leader>vt', ':new term://bash<bar>resize 15<cr>')
vim.keymap.set('n', '<leader>vv', ':vnew term://bash<cr>')
vim.keymap.set('n', '<leader>jj', ':new<cr>:call termopen("julia")<bar>resize 15<cr>')
vim.keymap.set('n', '<leader>jv', ':vnew<cr>:call termopen("julia")<cr>')
vim.keymap.set('t', '<C-n>', '<C-\\><C-n>')
