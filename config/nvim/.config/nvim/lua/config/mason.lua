local mason = require('mason')
local masonLspconfig = require('mason-lspconfig')
mason.setup({
  ui = {
    icons = {
      package_installed = '✓',
    },
    border = 'single',
  },
})
masonLspconfig.setup({
  ensure_installed = { 'sumneko_lua', 'tsserver', 'tailwindcss', 'gopls', 'bashls' },
})
