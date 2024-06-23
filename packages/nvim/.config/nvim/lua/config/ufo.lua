local lspconfig = require('lspconfig')
local ufo = require('ufo')
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true
}
local language_servers = lspconfig.util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
for _, ls in ipairs(language_servers) do
  lspconfig[ls].setup({
    capabilities = capabilities
  })
end
ufo.setup({
  provider_selector = function(bufnr, filetype, buftype)
    return {'treesitter', 'indent'}
  end
})
