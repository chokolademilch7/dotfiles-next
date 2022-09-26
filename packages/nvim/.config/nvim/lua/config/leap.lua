local leap = require('leap')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>s', '<Plug>(leap-forward)', opts)
keymap.set('n', '<leader>S', '<Plug>(leap-backward)', opts)
keymap.set('n', '<leader><leader>s', '<Plug>(leap-cross-window)', opts)

leap.setup({})
