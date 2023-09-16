local g = vim.g
local keymap = vim.keymap

-- Global options
g.ai_no_mappings = true

-- Keymaps
keymap.set('n', '<C-g>', ':AI ', { noremap = true })
keymap.set('v', '<C-g>', ':AI ', { noremap = true })
keymap.set('i', '<C-g>', '<Esc>:AI<CR>a', { noremap = true })
