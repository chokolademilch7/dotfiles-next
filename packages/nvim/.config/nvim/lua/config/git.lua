local git = require('git');

git.setup({
  default_mappings = false, -- NOTE: `quit_blame` and `blame_commit` are still merged to the keymaps even if `default_mappings = false`

  keymaps = {
    -- Open file/folder in git repository
    browse = "<Leader>go",
  },
  -- Default target branch when create a pull request
  target_branch = "develop",
})
