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
  ensure_installed = { 'lua_ls', 'tsserver', 'tailwindcss', 'gopls', 'bashls', 'eslint', 'jsonls', 'emmet_ls' },
})
