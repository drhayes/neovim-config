local colors = require('tokyonight.colors').setup({
  tokyonight_style = 'night',
  tokyonight_italic_comments = true,
  tokyonight_italic_keywords = true,
  tokyonight_dark_float = true,
})
-- local utils = require('tokyonight.util')

local theme = {
  colors = colors,
}

function theme.setup()
  vim.cmd[[colorscheme tokyonight]]
end


return theme
