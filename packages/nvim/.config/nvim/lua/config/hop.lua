local hop = require('hop')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('', '<leader><leader>j', '<CMD>HopLine<CR>', opts)
keymap.set('', '<leader><leader>k', '<CMD>HopLineStart<CR>', opts)
keymap.set('', '<leader>/', '<CMD>HopPattern<CR>', opts)
keymap.set('', 'F', '<CMD>HopWordMW<CR>', opts)
keymap.set('', '<leader>s', function()
  hop.hint_char1({ current_line_only = false }, opts)
end)
keymap.set('', 'f', function()
  hop.hint_char1({ current_line_only = true }, opts)
end)
-- keymap.set('', '<leader>s', function()
--   hop.hint_char1({}, opts)
-- end)

hop.setup({})
