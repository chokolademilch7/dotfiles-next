local lspconfig = require('lspconfig')
local keymap = vim.keymap
local lsp = vim.lsp
local diagnostic = vim.diagnostic

local on_attach = function(_, bufnr)
  -- Mappings.
  local opts = { noremap = true }
  -- keymap.set('n', 'gj', diagnostic.goto_next, opts)
  -- keymap.set('n', 'gk', diagnostic.goto_prev, opts)

  local bufopts = { noremap = true, buffer = bufnr }
  keymap.set('n', 'gD', lsp.buf.declaration, bufopts)
  keymap.set('n', 'gd', lsp.buf.definition, bufopts)
  keymap.set('n', 'gkl', function()
    vim.cmd('vsplit')
    lsp.buf.definition()
  end, bufopts)
  -- keymap.set('n', 'K', lsp.buf.hover, bufopts)
  keymap.set('n', 'gI', lsp.buf.implementation, bufopts)
  keymap.set('n', '<C-l>', lsp.buf.signature_help, bufopts)
  keymap.set('n', '<leader>wa', lsp.buf.add_workspace_folder, bufopts)
  keymap.set('n', '<leader>wr', lsp.buf.remove_workspace_folder, bufopts)
  keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  keymap.set('n', 'gt', lsp.buf.type_definition, bufopts)
  -- keymap.set('n', 'ge', lsp.buf.rename, bufopts)
  -- keymap.set('n', 'g.', lsp.buf.code_action, bufopts)
  keymap.set('n', 'gr', lsp.buf.references, bufopts)
  keymap.set('i', 'C-i', lsp.buf.completion, bufopts)
  keymap.set('n', 'gs', lsp.buf.workspace_symbol, bufopts)
  keymap.set('n', 'gi', lsp.buf.incoming_calls, bufopts)
  keymap.set('n', 'go', lsp.buf.outgoing_calls, bufopts)
  keymap.set('n', '<leader>kf', lsp.buf.format, bufopts)
  keymap.set('n', '<leader>ke', function()
    lsp.buf.code_action({ context = { only = { 'source.fixAll.eslint' } }, apply = true })
  end, bufopts)
end

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

lspconfig['lua_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig['emmet_ls'].setup({
  capabilities = capabilities,
  filetypes = { 'html', 'typescriptreact', 'javascript', 'css' },
  on_attach = on_attach,
})
lspconfig['eslint'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig['ts_ls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig['jsonls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig['tailwindcss'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig['gopls'].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})
lspconfig['bashls'].setup({
  on_attach = on_attach,
})
lspconfig['terraform_lsp'].setup({
  on_attach = on_attach,
})
lspconfig['biome'].setup({
  on_attach = on_attach,
})
-- lspconfig['yamlls'].setup({
--   filetypes = { 'yaml', 'yml' },
-- })
