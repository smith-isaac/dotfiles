vim.cmd([[colorscheme tokyonight-moon]])
require("roslyn").setup()

-- Make netrw respect gitignore
vim.g.netrw_list_hide = vim.fn['netrw_gitignore#Hide']() .. [[,.git/]]

-- require('silicon').setup {
--   font = 'CaskaydiaCove Nerd Font=20',
--   background = '#87f',
--   theme = 'OneHalfDark',
--   line_number = true,
--   pad_vert = 80,
--   pad_horiz = 50,
--   output = {
--     path = "/home/krivah/Pictures/Screenshots"
--   },
--   watermark = {
--     text = ' @smith-isaac',
--   },
--   window_title = function()
--     return vim.fn.fnamemodify(vim.fn.bufname(vim.fn.bufnr()), ':~:.')
--   end,
-- }
