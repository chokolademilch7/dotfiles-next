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
	use({
		"Shougo/defx.nvim",
		config = function()
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>f", ":Defx `escape(expand('%:p:h'), ' :')` -search=`expand('%:p')`<CR>", opts)
			local defx_key_settings = function()
				local onlyBuffer = { noremap = true, silent = true, buffer = true }
				vim.keymap.set("n", "q", vim.fn["defx#do_action"]("quit"), onlyBuffer)
				vim.keymap.set("n", "l", vim.fn["defx#do_action"]("open"), onlyBuffer)
				vim.keymap.set("n", "h", vim.fn["defx#do_action"]("cd", ".."), onlyBuffer)
			end
			local id = vim.api.nvim_create_augroup("DefxGroup", {})
			vim.api.nvim_create_autocmd("FileType", {
				group = "DefxGroup",
				pattern = { "defx" },
				callback = defx_key_settings,
			})
		end,
	})

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
