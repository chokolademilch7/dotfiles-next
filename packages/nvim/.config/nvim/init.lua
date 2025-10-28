local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local keymap = vim.keymap
local api = vim.api
local o = vim.o

-- Global option
g.mapleader = ' '

-- Option --
opt.number = true
opt.scrolloff = 10
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.splitright = true
opt.clipboard = 'unnamedplus'
opt.cursorline = true
opt.winblend = 20
opt.pumblend = 20
opt.ignorecase = true
opt.termguicolors = true
opt.autochdir = true

-- WSL options
if vim.fn.has('wsl') == 1 then
	vim.g.clipboard = {
		name = 'wsl-clipboard',
		copy = {
			['+'] = 'clip.exe',
			['*'] = 'clip.exe',
		},
		paste = {
			['+'] = 'powershell.exe -Command "[Console]::Out.Write([Console]::In.ReadToEnd())"',
			['*'] = 'powershell.exe -Command "[Console]::Out.Write([Console]::In.ReadToEnd())"',
		},
		cache_enabled = 1,
	}
end

-- Neovide option
if vim.g.neovide then
	o.guifont = 'PlemolJP Console NF:h14'
	local alpha = function()
		return string.format('%x', math.floor(255 * g.transparency or 0.8))
	end
	-- global options
	g.neovide_transparency = 0.4
	g.transparency = 0.8
	g.neovide_background_color = '#0f1117' .. alpha()
	g.neovide_floating_blur_amount_x = 2.0
	g.neovide_floating_blur_amount_y = 2.0
	g.neovide_cursor_vfx_mode = 'railgun'
	g.neovide_cursor_animation_length = 0.05
	g.neovide_cursor_trail_length = 0.05
	g.neovide_cursor_trail_size = 0.5

	local opts = { noremap = true, silent = true }

	-- keymaps
	keymap.set('n', '<D-s>', ':w<CR>', opts) -- Save
	keymap.set('v', '<D-c>', '"+y', opts)   -- Copy
	keymap.set('n', '<D-v>', '"+P', opts)   -- Paste normal mode
	keymap.set('v', '<D-v>', '"+P', opts)   -- Paste visual mode
	keymap.set('c', '<D-v>', '<C-R>+', opts) -- Paste command mode
	keymap.set('i', '<D-v>', '<ESC>l"+Pli', opts) -- Paste insert mode
end

-- Commands --
cmd([[command! PackerInstall packadd packer.nvim | lua require('plugins').install()]])
cmd([[command! PackerUpdate packadd packer.nvim | lua require('plugins').update()]])
cmd([[command! PackerSync packadd packer.nvim | lua require('plugins').sync()]])
cmd([[command! PackerClean packadd packer.nvim | lua require('plugins').clean()]])
cmd([[command! PackerCompile packadd packer.nvim | lua require('plugins').compile()]])
cmd([[command! PackerStatus packadd packer.nvim | lua require('plugins').status()]])

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

---- command line
keymap.set('c', '<C-p>', '<Up>', opts)
keymap.set('c', '<C-n>', '<Down>', opts)
keymap.set('c', '<C-b>', '<Left>', opts)
keymap.set('c', '<C-f>', '<Right>', opts)
keymap.set('c', '<C-a>', '<Home>', opts)
keymap.set('c', '<C-e>', '<End>', opts)
keymap.set('c', '<C-d>', '<Del>', opts)
keymap.set('c', '<C-k>', '<Esc><Right>C', opts)

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
keymap.set('n', 'se', ':s/<C-r>=expand("<cword>")<cr>/', interactive)

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
