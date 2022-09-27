local trouble = require('trouble')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>xx', ':TroubleToggle<CR>')

trouble.setup({})
