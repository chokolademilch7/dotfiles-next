local hop = require('hop')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('', '<leader><leader>j', '<CMD>HopLine<CR>', opts)
keymap.set('', '<leader><leader>k', '<CMD>HopLineStart<CR>', opts)
keymap.set('', '<leader>/', '<CMD>HopPattern<CR>', opts)
keymap.set('', 'f', '<CMD>HopWord<CR>', opts)
keymap.set('', 'F', '<CMD>HopWordMW<CR>', opts)
keymap.set('', '<leader>s', '<CMD>HopChar1CurrentLine<CR>', opts)

hop.setup({})
