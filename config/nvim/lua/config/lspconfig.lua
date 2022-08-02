local opts = { noremap = true }

vim.keymap.set('n', '<leader>kf', vim.lsp.buf.format, opts)
