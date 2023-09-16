local trouble = require('trouble')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>xx', '<cmd>TroubleToggle<cr>', opts)
keymap.set('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', opts)
keymap.set('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', opts)
keymap.set('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', opts)
keymap.set('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', opts)
keymap.set('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', opts)

trouble.setup({
  icons = true,
  signs = {
    error = '',
    warning = '',
    hint = '',
    information = '',
    other = '﫠'
  },
})
