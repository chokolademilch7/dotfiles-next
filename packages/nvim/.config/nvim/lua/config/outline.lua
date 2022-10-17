local outline = require('symbols-outline')
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set('n', '<leader>o', ':SymbolsOutlineOpen<CR>', opts)

outline.setup({
  auto_close = true,
  autofold_depth = 3,
  winblend = 20,
  symbols = {
    File = { icon = '', hl = 'TSURI' },
    Module = { icon = '', hl = 'TSNamespace' },
    Namespace = { icon = '', hl = 'TSNamespace' },
    Package = { icon = '', hl = 'TSNamespace' },
    Class = { icon = '𝓒', hl = 'TSType' },
    Method = { icon = 'ƒ', hl = 'TSMethod' },
    Property = { icon = '', hl = 'TSMethod' },
    Field = { icon = '', hl = 'TSField' },
    Constructor = { icon = '', hl = 'TSConstructor' },
    Enum = { icon = 'ℰ', hl = 'TSType' },
    Interface = { icon = 'ﰮ', hl = 'TSType' },
    Function = { icon = '', hl = 'TSFunction' },
    Variable = { icon = '', hl = 'TSConstant' },
    Constant = { icon = '', hl = 'TSConstant' },
    String = { icon = '𝓐', hl = 'TSString' },
    Number = { icon = '#', hl = 'TSNumber' },
    Boolean = { icon = '⊨', hl = 'TSBoolean' },
    Array = { icon = '', hl = 'TSConstant' },
    Object = { icon = '⦿', hl = 'TSType' },
    Key = { icon = '🔐', hl = 'TSType' },
    Null = { icon = 'NULL', hl = 'TSType' },
    EnumMember = { icon = '', hl = 'TSField' },
    Struct = { icon = '𝓢', hl = 'TSType' },
    Event = { icon = '🗲', hl = 'TSType' },
    Operator = { icon = '+', hl = 'TSOperator' },
    TypeParameter = { icon = '𝙏', hl = 'TSParameter' },
  },
})
