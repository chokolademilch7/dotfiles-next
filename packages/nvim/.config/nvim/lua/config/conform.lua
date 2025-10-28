local conform = require('conform')

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettierd' },
    typescript = { 'prettierd' },
    typescriptreact = { 'prettierd' },
    javascriptreact = { 'prettierd' },
    json = { 'prettierd' },
    html = { 'prettierd' },
    css = { 'prettierd' },
    markdown = { 'prettierd' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
})

vim.keymap.set('n', '<leader>kf', function()
  conform.format({ lsp_fallback = true })
end, { desc = 'Format buffer' })