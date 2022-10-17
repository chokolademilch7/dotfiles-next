local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({
      disable_commands = true,
      open_fn = require('packer.util').float,
    })
  end

  local use = packer.use
  packer.reset()

  -- Packer
  use({ 'wbthomason/packer.nvim', opt = true })

  -- LSP
  use({
    'williamboman/mason.nvim',
    config = function()
      require('config.mason')
    end,
  })
  use({
    'williamboman/mason-lspconfig.nvim',
  })
  use({
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lspconfig')
    end,
  })
  use({
    'glepnir/lspsaga.nvim',
    config = function()
      require('config.lspsaga')
    end,
  })
  use({
    'mxsdev/symbols-outline.nvim',
    branch = 'merge-jsx-tree',
    config = function()
      require('config.outline')
    end,
  })
  use({
    'stevearc/dressing.nvim',
    config = function()
      require('config.dressing')
    end,
  })
  use({
    'folke/trouble.nvim',
    config = function()
      require('config.trouble')
    end,
  })
  use({
    'j-hui/fidget.nvim',
    config = function()
      require('config.fidget')
    end,
  })

  -- CMP
  use({
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-cmdline' },
    config = function()
      require('config.cmp')
    end,
  })
  use({ 'L3MON4D3/LuaSnip', run = 'make install_jsregexp' })

  -- Theme
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('config.treesitter')
    end,
  })
  use({
    'projekt0n/github-nvim-theme',
    config = function()
      require('config.github-theme')
    end,
  })
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('config.lualine')
    end,
  })
  -- Icon
  use({
    'kyazdani42/nvim-web-devicons',
  })
  -- UI
  -- ScrollBar
  use({
    'petertriho/nvim-scrollbar',
    config = function()
      require('config.scrollbar')
    end,
  })

  -- Lint & Formatter
  use({
    'jose-elias-alvarez/null-ls.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      require('config.null-ls')
    end,
  })

  -- Filer
  use({
    'tamago324/lir.nvim',
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
      {
        'tamago324/lir-git-status.nvim',
      },
    },
    config = function()
      require('config.lir')
    end,
  })

  -- FuzzyFinder
  use({
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-telescope/telescope-file-browser.nvim' },
      { 'nvim-telescope/telescope-project.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = function()
      require('config.telescope')
    end,
  })

  -- TerminalDX
  -- Toggle
  use({
    'akinsho/toggleterm.nvim',
    config = function()
      require('config.toggleterm')
    end,
  })

  -- EditDX
  -- Motion
  use({
    'phaazon/hop.nvim',
    config = function()
      require('config.hop')
    end,
  })
  -- BufferLine
  use({
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('config.bufferline')
    end,
  })
  -- ZEN
  use({
    'Pocco81/true-zen.nvim',
    config = function()
      require('config.zen')
    end,
  })
  -- Comment
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('config.comment')
    end,
  })
  -- Surround
  use({
    'kylechui/nvim-surround',
    config = function()
      require('config.surround')
    end,
  })
  -- Autopairs
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('config.autopairs')
    end,
  })
  use({
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  })
  use({
    'kevinhwang91/nvim-ufo',
    requires = { 'kevinhwang91/promise-async' },
    config = function()
      require('config.ufo')
    end,
  })

  -- Git
  -- signs
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
  })
  use({
    'lukas-reineke/indent-blankline.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('config.indent-blankline')
    end,
  })
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end,
})

return plugins
