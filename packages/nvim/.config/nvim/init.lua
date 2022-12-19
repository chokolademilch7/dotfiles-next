local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local keymap = vim.keymap
local api = vim.api

-- Global option
g.mapleader = ' '

-- Option --
opt.number = true
opt.scrolloff = 5
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.splitright = true
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.winblend = 20
opt.ignorecase = true
opt.termguicolors = true
opt.autochdir = true

-- Commands --
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])

-- Keymaps --
local opts = { noremap = true, silent = true }
local interactive = { noremap = true }
local expr = { noremap = true, expr = true }

-- Utils
keymap.set('n', '<C-m>', ':noh<CR>', opts)
keymap.set('n', '<F12>', '<C-i>', opts)
keymap.set('n', '<leader>zz', ':source $MYVIMRC<CR>', opts)
keymap.set('n', '<leader><leader>z', ':PackerSync<CR>', opts)

-- Emacs like keybindings
keymap.set('i', '<C-p>', '<Up>', opts)
keymap.set('i', '<C-n>', '<Down>', opts)
keymap.set('i', '<C-b>', '<Left>', opts)
keymap.set('i', '<C-f>', '<Right>', opts)
keymap.set('i', '<C-a>', '<Home>', opts)
keymap.set('i', '<C-e>', '<End>', opts)
keymap.set('i', '<C-d>', '<Del>', opts)
keymap.set('i', '<C-k>', '<Esc><Right>C', opts)

-- Windows control
keymap.set('n', '<leader>2', ':split<CR>', opts)
keymap.set('n', '<leader>3', ':vsplit<CR>', opts)
keymap.set('n', '<leader>h', '<C-w>h', opts)
keymap.set('n', '<leader>k', '<C-w>k', opts)
keymap.set('n', '<leader>j', '<C-w>j', opts)
keymap.set('n', '<leader>l', '<C-w>l', opts)
keymap.set('n', '<leader>c', '<C-w>c', opts)
keymap.set('n', '<leader><leader>q', ':q!<CR>', opts)
keymap.set('n', '<leader><leader>Q', ':qa!<CR>', opts)
keymap.set('n', 'te', ':tabe ', interactive)

-- Yank control
keymap.set('n', 's"', 'ci"')
keymap.set('n', 'se', ':%s/<C-r>=expand("<cword>")<cr>/', interactive)


-- Buffer control
keymap.set('n', '<leader>q', ':bdelete<CR>', opts)
keymap.set('n', 'H', ':bp<CR>', opts)
keymap.set('n', 'L', ':bnext<CR>', opts)

-- QuickFix
keymap.set('n', '<leader>cn', ':cnext<CR>', opts)
keymap.set('n', '<leader>cp', ':cprev<CR>', opts)
local qf_key_settings = function()
  local onlyBuffer = { noremap = true, buffer = true }
  keymap.set('n', '<CR>', ':.cc<CR>|:cclose<CR>', onlyBuffer)
  keymap.set('n', 'o', ':.cc<CR>', onlyBuffer)
end
api.nvim_create_augroup('QfGroup', {})
api.nvim_create_autocmd('FileType', {
  group = 'QfGroup',
  pattern = { 'qf' },
  callback = qf_key_settings,
})
