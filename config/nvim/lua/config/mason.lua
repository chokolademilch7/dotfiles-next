local mason = require('mason')
local masonLspconfig = require('mason-lspconfig')
mason.setup()
masonLspconfig.setup({
  ensure_installed = { 'sumneko_lua', 'tsserver' },
})
