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
  vim.g.tokyonight_style = 'storm'
  vim.g.tokyonight_italic_comments = true
  vim.g.tokyonight_italic_functions = true
  vim.g.tokyonight_dark_float = true
  vim.cmd[[colorscheme tokyonight]]
end


return theme
