local githubTheme = require('github-theme')

githubTheme.setup({
  theme_style = 'dark',
  transparent = true,
  overrides = function(c)
    return {
      CursorLine = {
        fg = 'none',
        bg = 'none',
        style = 'underline',
      },
    }
  end,
})
