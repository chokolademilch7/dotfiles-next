local opts = { noremap = true, silent = true }

-- Run trigger
vim.keymap.set("n", "<leader>f", ":Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>", opts)

local defx_key_settings = function()
  local onlyBuffer = { noremap = true, silent = true, buffer = true }
  vim.keymap.set("n", "q", vim.fn["defx#do_action"]("quit"), onlyBuffer)
  vim.keymap.set("n", "l", vim.fn["defx#do_action"]("open"), onlyBuffer)
  vim.keymap.set("n", "h", vim.fn["defx#do_action"]("cd", ".."), onlyBuffer)
end

local id = vim.api.nvim_create_augroup("DefxGroup", {})
vim.api.nvim_create_autocmd("FileType", {
  group = "DefxGroup",
  pattern = { "defx" },
  callback = defx_key_settings,
})
