local lspconfig = require('lspconfig')
local keymap = vim.keymap
local lsp = vim.lsp

local on_attach = function(client, bufnr)
  -- set omnifunc
  -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- Mappings.
  local bufopts = { noremap = true, buffer = bufnr }
  keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
  keymap.set('n', 'gd', lsp.buf.definition, bufopts)
  keymap.set('n', 'K', lsp.buf.hover, bufopts)
  keymap.set('n', 'gi', lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-k>', lsp.buf.signature_help, bufopts)
  keymap.set('n', '<leader>wa', lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<leader>wr', lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', 'gt', lsp.buf.type_definition, bufopts)
  keymap.set('n', 'ge', lsp.buf.rename, bufopts)
  keymap.set('n', 'g.', lsp.buf.code_action, bufopts)
  keymap.set('n', 'gr', lsp.buf.references, bufopts)
  keymap.set('n', '<leader>kf', lsp.buf.formatting, bufopts)
end

lspconfig['sumneko_lua'].setup({
  on_attach = on_attach,
})
lspconfig['tsserver'].setup({
  on_attach = on_attach,
})
