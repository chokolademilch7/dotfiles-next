local outline = require('symbols-outline')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>o', ':SymbolsOutlineOpen<CR>', opts)

outline.setup({
  auto_close = true,
  autofold_depth = 3,
  winblend = 20
})
