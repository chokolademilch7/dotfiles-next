local saga = require('lspsaga')
local keymap = vim.keymap
local opts = { silent = true }

keymap.set('n', 'ge', '<cmd>Lspsaga rename<CR>', opts)
keymap.set('n', 'gf', '<cmd>Lspsaga lsp_finder<CR>', opts)
-- keymap.set('n', 'g.', '<cmd>Lspsaga code_action<CR>', opts)
keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>', opts)
keymap.set('n', 'go', '<cmd>Lspsaga show_cursor_diagnostics<CR>', opts)
keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
keymap.set('n', 'gj', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap.set('n', 'gk', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
-- Show line diagnostics
keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true })
-- Show cursor diagnostic
keymap.set("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true })

saga.init_lsp_saga({
  show_outline = {
    auto_refresh = true,
  },
  code_action_lightbulb = {
    enable = false,
  },
})
