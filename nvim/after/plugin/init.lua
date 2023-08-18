vim.cmd([[
let g:silicon = {
    \   'theme':              'OneHalfDark',
    \   'font':                  'Hack',
    \   'background':         '#AAAAFF',
    \   'shadow-color':       '#555555',
    \   'line-pad':                   2,
    \   'pad-horiz':                 80,
    \   'pad-vert':                 100,
    \   'shadow-blur-radius':         0,
    \   'shadow-offset-x':            0,
    \   'shadow-offset-y':            0,
    \   'line-number':           v:true,
    \   'round-corner':          v:true,
    \   'window-controls':       v:false,
    \ }
    ]])

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
