local opts = { noremap = true, silent = true }

-- Run trigger
vim.keymap.set(
  'n',
  '<leader>f',
  ":Defx -new -columns=indent:mark:icon:space:icons:space:filename:git:size `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>",
  opts
)

local defx_key_settings = function()
  local onlyBuffer = { noremap = true, silent = true, buffer = true }
  vim.keymap.set('n', 'q', vim.fn['defx#do_action']('quit'), onlyBuffer)
  vim.keymap.set('n', 'l', vim.fn['defx#do_action']('open'), onlyBuffer)
  vim.keymap.set('n', 'e', vim.fn['defx#do_action']('open', 'vsplit'), onlyBuffer)
  vim.keymap.set('n', 'x', vim.fn['defx#do_action']('execute_system'), onlyBuffer)
  vim.keymap.set('n', '!', vim.fn['defx#do_action']('execute_command'), onlyBuffer)
  vim.keymap.set('n', 'h', vim.fn['defx#do_action']('cd', '..'), onlyBuffer)
  vim.keymap.set('n', 'o', vim.fn['defx#do_action']('open_or_close_tree'), onlyBuffer)
  vim.keymap.set('n', 'K', vim.fn['defx#do_action']('new_directory'), onlyBuffer)
  vim.keymap.set('n', 'N', vim.fn['defx#do_action']('new_file'), onlyBuffer)
  vim.keymap.set('n', 'd', vim.fn['defx#do_action']('remove'), onlyBuffer)
  vim.keymap.set('n', 'r', vim.fn['defx#do_action']('rename'), onlyBuffer)
  vim.keymap.set('n', 'c', vim.fn['defx#do_action']('copy'), onlyBuffer)
  vim.keymap.set('n', 'p', vim.fn['defx#do_action']('paste'), onlyBuffer)
  vim.keymap.set('n', 'yy', vim.fn['defx#do_action']('yank_path'), onlyBuffer)
  vim.keymap.set('n', 'm', vim.fn['defx#do_action']('toggle_select'), onlyBuffer)
  vim.keymap.set('n', '.', vim.fn['defx#do_action']('toggle_ignored_files'), onlyBuffer)
end

vim.api.nvim_create_augroup('DefxGroup', {})
vim.api.nvim_create_autocmd('FileType', {
  group = 'DefxGroup',
  pattern = { 'defx' },
  callback = defx_key_settings,
})

vim.fn['defx#custom#column']('icon', { directory_icon = '▸', opened_icon = '▾', root_icon = ' ' })

vim.fn['defx#custom#column']('git', 'indicators', {
  Modified = 'M',
  Staged = '✚',
  Untracked = '✭',
  Renamed = '➜',
  Unmerged = '═',
  Ignored = '☒',
  Deleted = '✖',
  Unknown = '?',
})
