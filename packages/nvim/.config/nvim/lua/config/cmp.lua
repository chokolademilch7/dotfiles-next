local cmp = require('cmp')
local luasnip = require('luasnip')

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-[>'] = function(fallback)
    --   if cmp.visible() then
    --     cmp.abort()
    --   else
    --     fallback()
    --   end
    -- end,
    ['<F12>'] = function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end,
    ['<CR>'] = function(fallback)
      if cmp.visible() then
        cmp.confirm()
      else
        fallback()
      end
    end,
    ['<C-j>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-k>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline({
    ['<C-n'] = function(fallback)
      print('AAAAAAAAAAAAAA')
      fallback()
    end,
    ['<C-p'] = function(fallback)
      fallback()
    end,
    ['<C-j>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<C-k>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
  sources = {
    { name = 'cmdline' },
  },
})

cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})
