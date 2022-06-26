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
		config = function()
			local opts = { noremap = true }
			vim.keymap.set("n", "<leader>kf", vim.lsp.buf.format, opts)
		end,
	})

	-- Theme
	use({
		"projekt0n/github-nvim-theme",
		config = function()
			require("github-theme").setup({
				theme_style = "dark",
				transparent = true,
			})
		end,
	})

	-- Lint & Formatter
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
				},
			})
		end,
	})

	-- Filer
	-- FuzzyFinder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "sf", builtin.find_files)
			vim.keymap.set("n", "sl", builtin.live_grep)
			vim.keymap.set("n", "sh", builtin.oldfiles)
			vim.keymap.set("n", "sb", builtin.buffers)
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
