local agitator = require('agitator')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>gl', agitator.git_blame_toggle, opts)
keymap.set('n', '<leader>gl', function()
  agitator.git_blame_toggle({
    sidebar_width = 45,
    formatter = function(r)
      local summaryMessage
      if r.author == 'Not Committed Yet' then
        summaryMessage = 'Nothing'
      else
        summaryMessage = r.summary
      end
      return string.format(
        '%02d-%02d-%02d | %s | %s',
        r.date.year,
        r.date.month,
        r.date.day,
        r.author,
        summaryMessage
      )
    end,
  })
end, opts)
keymap.set('n', '<leader>gt', agitator.git_time_machine, opts)
