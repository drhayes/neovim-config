
local keyMappings = {}

local function fileMaps()
  return {
    name = '+file',
    f = {[[<cmd>lua require('telescope.builtin').find_files()<CR>]], 'Find Files'}
  }
end

function keyMappings.initKeymap()
  local wk = require 'which-key'

  wk.register({
    f = fileMaps(),
  })
end

return keyMappings
