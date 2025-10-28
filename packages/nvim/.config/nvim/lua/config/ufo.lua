local ufo = require('ufo')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
-- Use vim.lsp.config instead of lspconfig
local language_servers = {'lua_ls', 'gopls', 'ts_ls', 'eslint', 'jsonls'} -- list servers manually
for _, ls in ipairs(language_servers) do
  vim.lsp.config(ls, {
    capabilities = capabilities
  })
end
ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})
