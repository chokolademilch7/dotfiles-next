local trouble = require('trouble.providers.telescope')
local telescope = require('telescope')
local builtin = require('telescope.builtin')

vim.keymap.set('n', 'sF', builtin.find_files)
vim.keymap.set('n', 'sf', builtin.git_files)
vim.keymap.set('n', 'sg', builtin.git_status)
vim.keymap.set('n', 'sl', builtin.live_grep)
vim.keymap.set('n', 'ss', builtin.grep_string)
vim.keymap.set('n', 'sh', builtin.oldfiles)
vim.keymap.set('n', 'sb', builtin.buffers)
vim.keymap.set('n', 'sq', builtin.quickfix)
vim.keymap.set('n', 'sj', builtin.jumplist)
vim.keymap.set('n', 'sd', builtin.diagnostics)
vim.keymap.set('n', 'st', builtin.treesitter)

telescope.setup({
  defaults = {
    mappings = {
      i = { ['<c-t>'] = trouble.open_with_trouble },
      n = { ['<c-t>'] = trouble.open_with_trouble },
    },
  },
})
