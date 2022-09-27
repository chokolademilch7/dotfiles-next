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
    'stevearc/dressing.nvim',
    config = function()
      require('config.dressing')
    end
  })

  -- Theme
  use({
    'nvim-treesitter/nvim-treesitter',
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
  use({
    'kyazdani42/nvim-web-devicons',
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
    requires = { { 'nvim-lua/plenary.nvim' } },
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
  -- EasyMotion
  use({
    'ggandor/leap.nvim',
    config = function()
      require('config.leap')
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

  -- Git
  -- signs
  use({
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
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
