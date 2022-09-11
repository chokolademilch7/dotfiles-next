local githubTheme = require('github-theme')

githubTheme.setup({
  theme_style = 'dark',
  transparent = true,
  overrides = function(_)
    return {
      CursorLine = {
        fg = 'none',
        bg = 'none',
        style = 'underline',
      },
      NormalFloat = {
        bg = 'none'
      }
    }
  end,
})
