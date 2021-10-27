local gps = require 'nvim-gps'

return {
  setup = function()
    gps.setup({
      icons = {
        ['class-name'] = ' ',      -- Classes and class-like objects
        ['function-name'] = ' ',   -- Functions
        ['method-name'] = ' '      -- Methods (functions inside class-like objects)
      },
      -- Disable any languages individually over here
      -- Any language not disabled here is enabled by default
      languages = {
        -- ['bash'] = false,
      },
      separator = ' > ',
    })
  end
}
