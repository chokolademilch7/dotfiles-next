local builtin = require('telescope.builtin')

vim.keymap.set('n', 'sf', builtin.find_files)
vim.keymap.set('n', 'sl', builtin.live_grep)
vim.keymap.set('n', 'sh', builtin.oldfiles)
vim.keymap.set('n', 'sb', builtin.buffers)
