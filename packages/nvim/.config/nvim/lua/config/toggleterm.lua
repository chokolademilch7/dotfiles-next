local api = vim.api
local opts = { noremap = true, silent = true }
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "CONFIG_DIR=$HOME/.config/lazygit lazygit",
  direction = 'float',
  hidden = true,
})
local nnn = Terminal:new({
  cmd = "nnn -aP p",
  direction = 'float',
  hidden = true,
})

function Lazygit_toggle()
  lazygit:toggle()
end

function NNN_toggle()
  nnn:toggle()
end

api.nvim_set_keymap('n', '<leader>gg', ':lua Lazygit_toggle()<CR>', opts)
api.nvim_set_keymap('n', '<leader>nn', ':lua NNN_toggle()<CR>', opts)
