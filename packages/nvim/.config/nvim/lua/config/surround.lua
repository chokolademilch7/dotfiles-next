local surround = require('mini.surround')

surround.setup({
  highlight_duration = 3000,
  mappings = {
    add = 'r',
    find = '',
    replace = 'rr',
    delete = 'rd',
    highlight = 'rh',
  },
})
