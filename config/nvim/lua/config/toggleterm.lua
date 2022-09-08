local api = vim.api
local opts = { noremap = true, silent = true }
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "CONFIG_DIR=$HOME/.config/lazygit lazygit",
  direction = 'float',
  hidden = true,
})
local nnn = Terminal:new({
  cmd = "nnn",
  direction = 'float',
  hidden = true,
})

---@diagnostic disable-next-line: lowercase-global
function _lazygit_toggle()
  lazygit:toggle()
end

---@diagnostic disable-next-line: lowercase-global
function _nnn_toggle()
  nnn:toggle()
end

api.nvim_set_keymap('n', '<leader>gg', ':lua _lazygit_toggle()<CR>', opts)
api.nvim_set_keymap('n', '<leader>nn', ':lua _nnn_toggle()<CR>', opts)
