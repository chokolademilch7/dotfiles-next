local g = vim.g
local cmd = vim.cmd

-- global settings
g.jsonpath_register = '*'

-- key mappings
cmd([[
  au FileType json noremap <buffer> <silent> <leader>yy :call jsonpath#echo()<CR>
]])
