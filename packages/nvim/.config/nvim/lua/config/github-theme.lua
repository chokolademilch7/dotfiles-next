local githubTheme = require('github-theme')

githubTheme.setup({
  options = {
    transparent = true,
  },
  groups = {
    all = {
      CursorLine = {
        fg = 'none',
        bg = 'none',
        style = 'underline',
      },
      NormalFloat = {
        bg = 'none',
      },
    },
  },
})

vim.cmd.colorscheme('github_dark')
