local lspconfig = require('lspconfig')
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local on_attach = function(_, bufnr)
  -- set omnifunc
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local opts = { noremap = true }
  keymap.set('n', 'gj', diagnostic.goto_next, opts)
  keymap.set('n', 'gk', diagnostic.goto_prev, opts)

  local bufopts = { noremap = true, buffer = bufnr }
  keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
  keymap.set('n', 'gd', lsp.buf.definition, bufopts)
  keymap.set('n', 'K', lsp.buf.hover, bufopts)
  keymap.set('n', 'gI', lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-l>', lsp.buf.signature_help, bufopts)
  keymap.set('n', '<leader>wa', lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<leader>wr', lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', 'gt', lsp.buf.type_definition, bufopts)
  keymap.set('n', 'ge', lsp.buf.rename, bufopts)
  keymap.set('n', 'g.', lsp.buf.code_action, bufopts)
  keymap.set('n', 'gr', lsp.buf.references, bufopts)
  keymap.set('i', 'C-i', lsp.buf.completion, bufopts)
  keymap.set('n', 'gs', lsp.buf.workspace_symbol, bufopts)
  keymap.set('n', 'gi', lsp.buf.incoming_calls, bufopts)
  keymap.set('n', 'go', lsp.buf.outgoing_calls, bufopts)
  keymap.set('n', '<leader>kf', lsp.buf.format, bufopts)
end

lspconfig['sumneko_lua'].setup({
  on_attach = on_attach,
})
lspconfig['tsserver'].setup({
  on_attach = on_attach,
})
lspconfig['lspconfig'].setup({
  on_attach = on_attach,
})
