local trouble = require('trouble.providers.telescope')
local telescope = require('telescope')
local builtin = require('telescope.builtin')
local opts = { noremap = true }
local fb_actions = telescope.extensions.file_browser.actions
local ts_actions = require('telescope.actions')
-- local project = telescope.extensions.project

vim.keymap.set('n', 'sF', builtin.find_files, opts)
vim.keymap.set('n', 'sf', builtin.git_files, opts)
vim.keymap.set('n', 'sg', builtin.git_status, opts)
vim.keymap.set('n', 'sl', function()
  builtin.live_grep({
    cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
  })
end, opts)
vim.keymap.set('n', 'ss', function()
  builtin.grep_string({
    cwd = vim.fn.systemlist('git rev-parse --show-toplevel')[1],
  })
end, opts)
-- vim.keymap.set('n', 'ss', builtin.grep_string, opts)
vim.keymap.set('n', 'sh', builtin.oldfiles, opts)
vim.keymap.set('n', 'sb', builtin.buffers, opts)
vim.keymap.set('n', 'sq', builtin.quickfix, opts)
vim.keymap.set('n', 'sj', builtin.jumplist, opts)
vim.keymap.set('n', 'sd', builtin.diagnostics, opts)
vim.keymap.set('n', 'st', builtin.treesitter, opts)
vim.keymap.set('n', 'sr', builtin.current_buffer_fuzzy_find, opts)

-- telescope-zoxide
vim.keymap.set('n', 'so', telescope.extensions.zoxide.list, opts)

-- telescope-file_browser
vim.keymap.set('n', 'su', telescope.extensions.file_browser.file_browser, opts)

-- telescope-project
-- vim.keymap.set('n', 'so', function()
--   project.project({})
-- end, opts)

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
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<c-d>'] = ts_actions.delete_buffer,
        },
      },
    },
  },
  extensions = {
    zoxide = {
      mappings = {
        default = {
          action = function(selection)
            vim.cmd('cd ' .. selection.path)
            builtin.git_files({ cwd = selection.path })
          end,
          after_action = function(selection)
            print('Directory changed to ' .. selection.path)
          end,
        },
        ['<C-b>'] = {
          keepinsert = true,
          action = function(selection)
            telescope.extensions.file_browser.file_browser({ cwd = selection.path })
          end,
        },
        ['<C-l>'] = {
          keepinsert = true,
          action = function(selection)
            builtin.live_grep({
              cwd = selection.path,
            })
          end,
        },
      },
    },
    file_browser = {
      mappings = {
        ['n'] = {
          ['<F12>'] = fb_actions.goto_parent_dir,
        },
        ['i'] = {
          ['<F12>'] = fb_actions.goto_parent_dir,
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
telescope.load_extension('zoxide')
