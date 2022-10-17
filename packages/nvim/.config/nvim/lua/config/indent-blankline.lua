local blankline = require('indent_blankline')
vim.opt.list = true
vim.cmd([[highlight IndentBlanklineContextStart guisp=#F5C2E7 gui=underline]])

blankline.setup({
  enabled = true,
  max_indent_increase = 1,
  use_treesitter_scope = true,
  use_treesitter = true,
  show_current_context = true,
  show_current_context_start = true,
  trailing_blankline_indent = false,
  show_first_indent_level = true,
  char = '▏',
})
