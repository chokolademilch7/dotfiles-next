local trouble = require('trouble.providers.telescope')
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local opts = { noremap = true }
local fb_actions = telescope.extensions.file_browser.actions
local project = telescope.extensions.project

vim.keymap.set('n', 'sF', builtin.find_files, opts)
vim.keymap.set('n', 'sf', builtin.git_files, opts)
vim.keymap.set('n', 'sg', builtin.git_status, opts)
vim.keymap.set('n', 'sl', builtin.live_grep, opts)
vim.keymap.set('n', 'ss', builtin.grep_string, opts)
vim.keymap.set('n', 'sh', builtin.oldfiles, opts)
vim.keymap.set('n', 'sb', builtin.buffers, opts)
vim.keymap.set('n', 'sq', builtin.quickfix, opts)
vim.keymap.set('n', 'sj', builtin.jumplist, opts)
vim.keymap.set('n', 'sd', builtin.diagnostics, opts)
vim.keymap.set('n', 'st', builtin.treesitter, opts)
vim.keymap.set('n', 'sr', builtin.current_buffer_fuzzy_find, opts)
vim.keymap.set('n', 'su', ':Telescope file_browser<CR>', opts)
vim.keymap.set('n', 'so', function()
  project.project({})
end, opts)

telescope.setup({
  defaults = {
    sorting_strategy = 'ascending',
    layout_config = {
      prompt_position = 'top',
    },
    mappings = {
      i = { ['<C-t>'] = trouble.open_with_trouble, ['<C-o>'] = 'which_key' },
      n = { ['<C-t>'] = trouble.open_with_trouble },
    },
  },
  extensions = {
    file_browser = {
      mappings = {
        ['n'] = {
          ['<A-h>'] = fb_actions.goto_parent_dir,
        },
        ['i'] = {
          ['<A-h>'] = fb_actions.goto_parent_dir,
          ['<C-h>'] = false,
          ['<C-.>'] = fb_actions.toggle_hidden,
        },
      },
    },
  },
})

-- you need to call load_extension, somewhere after setup function
telescope.load_extension('file_browser')
telescope.load_extension('project')
