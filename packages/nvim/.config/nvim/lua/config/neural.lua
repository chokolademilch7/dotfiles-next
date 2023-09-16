local neural = require('neural')
local keymap = vim.keymap

keymap.set('n', 'mm', ':Neural<CR>')

neural.setup({
  ui = {
    prompt_icon = ' ⚡',
  },
  source = {
    openai = {
      api_key = vim.env.OPENAI_API_KEY,
    },
  },
})
