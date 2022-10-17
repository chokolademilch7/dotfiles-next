local agitator = require('agitator')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>gl', agitator.git_blame_toggle, opts)
keymap.set('n', '<leader>gt', agitator.git_time_machine, opts)
