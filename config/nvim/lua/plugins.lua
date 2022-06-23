local packer = nil
local function init()
  if packer == nil then
    packer = require('packer')
    packer.init({disable_commands = true})
  end
  
  local use = packer.use
  packer.reset()

  -- Packer
  use {'wbthomason/packer.nvim', opt = true}
end

local plugins = setmetatable({}, {
  __index = function(_, key)
    init()
    return packer[key]
  end
})

return plugins
