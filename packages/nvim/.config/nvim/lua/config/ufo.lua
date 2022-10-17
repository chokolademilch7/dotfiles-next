local ufo = require('ufo')
local keymap = vim.keymap
local opt = vim.opt

-- opt.foldcolumn = '1'
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

local opts = { noremap = true, silent = true }

keymap.set('n', 'zR', ufo.openAllFolds, opts)
keymap.set('n', 'zM', ufo.closeAllFolds, opts)
keymap.set('n', 'zr', ufo.openFoldsExceptKinds, opts)
keymap.set('n', 'zm', ufo.closeFoldsWith, opts) -- closeAllFolds == closeFoldsWith(0)
keymap.set('n', 'z1', function()
  ufo.closeFoldsWith(1)
end, opts)
keymap.set('n', 'z2', function()
  ufo.closeFoldsWith(2)
end, opts)
keymap.set('n', 'z3', function()
  ufo.closeFoldsWith(3)
end, opts)
keymap.set('n', 'z4', function()
  ufo.closeFoldsWith(4)
end, opts)
keymap.set('n', 'zk', ufo.goPreviousClosedFold, opts)
keymap.set('n', 'zj', ufo.goNextClosedFold, opts)

local handler = function(virtText, lnum, endLnum, width, truncate)
  local newVirtText = {}
  local suffix = ('  %d '):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument, need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, 'MoreMsg' })
  return newVirtText
end

ufo.setup({
  fold_virt_text_handler = handler,
  close_fold_kinds = { 'imports' },
})
