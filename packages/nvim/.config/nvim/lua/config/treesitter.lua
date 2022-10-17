local treesitter = require('nvim-treesitter')
local parser = require("nvim-treesitter.parsers")
local parser_config = parser.get_parser_configs()
parser_config.tsx.filetype_to_parsername = {"javascript", "typescript.tsx"}

treesitter.setup({
  ensure_installed = 'maintained',
  highlight = {
    enable = true,
    use_languagetree = true,
    additional_vim_regex_highlight = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
