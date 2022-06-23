local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({
      disable_commands = true,
      open_fn = require('packer.util').float,
    })
  end
  
  local use = packer.use
  packer.reset()

  -- Packer
  use {'wbthomason/packer.nvim', opt = true}

  -- Theme
  use {
    'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({
        theme_style = 'dark',
        transparent = true
      })
    end
  }
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
