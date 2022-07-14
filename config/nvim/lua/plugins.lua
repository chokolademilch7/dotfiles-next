local packer = nil
local function init()
	if packer == nil then
		packer = require("packer")
		packer.init({
			disable_commands = true,
			open_fn = require("packer.util").float,
		})
	end

	local use = packer.use
	packer.reset()

	-- Packer
	use({ "wbthomason/packer.nvim", opt = true })

	-- LSP
	use({
		"williamboman/nvim-lsp-installer",
	})
	use({
		"neovim/nvim-lspconfig",
    config = require('config.lspconfig')
	})

	-- Theme
  use({
    "nvim-treesitter/nvim-treesitter",
  })
	use({
		"projekt0n/github-nvim-theme",
    config = require('config.github-theme')
	})

	-- Lint & Formatter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
    config = require('config.null-ls')
	})

	-- Filer
	use({
		"Shougo/defx.nvim",
    config = require('config.defx')
	})

	-- FuzzyFinder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
    config = require('config.telescope')
	})
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		init()
		return packer[key]
	end,
})

return plugins
