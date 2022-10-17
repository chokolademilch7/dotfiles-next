local bufferline = require('bufferline')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>b', ':BufferLinePick<CR>', opts)

bufferline.setup({
  options = {
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_buffer_close_icons = false,
    -- indicator = {
    --   style = 'underline',
    -- },
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or ' ')
        s = s .. n .. sym
      end
      return s
    end,
  },
})
