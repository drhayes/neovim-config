return {
  'uga-rosa/ccc.nvim',
  build = function()
    local ccc = require 'ccc'
    ccc.setup({
      highlighter = {
	auto_enable = true,
      },
    })
  end,
}
